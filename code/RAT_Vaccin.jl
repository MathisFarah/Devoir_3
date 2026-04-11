# Code des fonctions de l'intervention de vaccination
"""
    function VoisinsMort(mort::Agent, rayon::Integer)

Fonction qui renvoie les voisins non vaccinés d'un agent mort dans un rayon choisi selon la distance

mort : un agent qui viens de mourrir et autour duquel nous allons trouver les voisins
rayon : la distance autour duquel nous allons chercher pour les agents voisins
"""

function VoisinsMort(mort::Agent, rayon::Integer)
    popVoisins = Agent[]

    ## Boucle qui passe au travers de tous les agents de la population

    for agent in population

        ## Si l'agent se retrouve dans un rayon choisi de l'agent mort et qu'il n'est pas vacciné, on l'ajoute au vecteur 

        if abs(agent.x - mort.x) < rayon && abs(agent.y - mort.y) < rayon && !isvaccinated(agent)
            push!(popVoisins, agent)
        end
    end
    return popVoisins
end

"""
    function RATPopulation(pop::Population)

Fonction qui test une population d'agent non testé et renvoie les agents qui ont testé positif aux test
La fonction n'effectue les tests que s'il reste assez d'argent dans le budget puis note les dépenses

pop : Population d'agent qui avoisine un agent qui viens de mourir et auquels nous allons effecter des RAT
"""

function RATPopulation(pop::Population)
    global budget
    global depenseRAT
    popPositif = Agent[]

    ## Boucle qui passe au travers de la population reçu en argument, mais seulement ceux qui n'ont pas été testés

    for agent in nottested(pop)

        ## S'assure qu'on a assez de budget pour faire un RAT sur l'agent, sinon on arrete les tests

        if budget > coutRAT

            ## Enlève le cout du test

            budget -= coutRAT

            ## Ajout le cout aux dépenses

            depenseRAT += coutRAT

            ## Enregistre que cet agent a été testé pour ce tick, pour ne pas le retesté si plusieurs morts

            agent.tested = true

            ## Enregistre l'événement de vaccination

            push!(eventsRAT, RATEvent(tick, agent.id, agent.x, agent.y))

            ## Renvoie un vrai positif pour une probabilité de 'efficaciteRAT' si l'agent est infecté

            if efficaciteRAT > rand() && isinfectious(agent)
                push!(popPositif, agent)

                ## Renvoie un faux positif pour une probabilité de 1 - 'efficaciteRAT' si l'agent est sain

            elseif efficaciteRAT < rand() && ishealthy(agent)
                push!(popPositif, agent)
            end
        else
            break
        end
    end
    return popPositif
end

"""
    function VaccinPopulation(popVaccin::Population)

Fonction qui vaccine la population totale selon la population reçu en argument
La fonction n'effectue les vaccinations que s'il reste assez d'argent dans le budget puis note les dépenses
Les agents qui se font vacciner ont leur temps de latence de vaccination ajuster 2, le temps d'attente avant que le vaccin fasse effet

pop : Population d'agent qui ont testé positif aux test RAT
"""

function VaccinPopulation(popVaccin::Population)
    global budget
    global depenseVaccin
    for agent in popVaccin

        ## S'assure qu'on a assez d'argent pour vacciner l'agent, sinon arrête les vaccinations

        if budget > coutVaccin

            ## Enlève le cout du test

            budget -= coutVaccin

            ## Ajoute le coût aux dépenses

            depenseVaccin += coutVaccin

            ##Enregistre l'événement de vaccination

            push!(eventsVac, VaccinationEvent(tick, agent.id, agent.x, agent.y))

            ## Ajuste le temps de lattence avant que le vaccin fasse effet

            agent.vaccinationclock = 2
        else
            break
        end
    end
end

"""
    function Vaccination(popMort::Population, rayon::Int)

Fonction qui effectue tous les étapes de la vaccintaion, soit trouver les agents voisins d'une population d'agent mort, 
les tests, puis vaccinent  ceux qui ont testé positif

popMort : Population d'agent mort aux dernier tick
rayon : Distance dans laquel nous allons chercher pour les voinsins des agents morts
"""
function Vaccination(popMort::Population, rayon::Int)
    for mort in popMort
        VaccinPopulation(RATPopulation(VoisinsMort(mort, rayon)))
    end
end