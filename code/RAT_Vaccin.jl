"""
    function VoisinsMort(mort::Agent, rayon::Integer)

Fonction qui renvoie les voisins non vaccinés d'un agent mort dans un rayon choisi selon la distance

mort : un agent qui viens de mourrir et autour duquel nous allons trouver les voisins
rayon : la distance autour duquel nous allons chercher pour les agents voisins
"""

function VoisinsMort(mort::Agent, rayon::Integer)
    popVoisins = Agent[]
    for agent in population
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

    for agent in nottested(pop)
        if budget > coutRAT
            budget -= coutRAT
            depenseRAT += coutRAT
            agent.tested = true
            push!(eventsRAT, RATEvent(tick, agent.id, agent.x, agent.y))

            if (efficaciteRAT > rand() && isinfectious(agent)) || (efficaciteRAT < rand() && ishealthy(agent))
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
        if budget > coutVaccin
            budget -= coutVaccin
            depenseVaccin += coutVaccin
            push!(eventsVac, VaccinationEvent(tick, agent.id, agent.x, agent.y))
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