# Fonction qui renvoie les voisins non vaccinés d'un agent mort dans un rayon choisi selon la distance

function VoisinsMort(mort::Agent, rayon::Integer)
    popVoisins = Agent[]

    # Boucle qui passe au travers de tous les agenst de la population

    for agent in population

        # Si l'agent se retrouve dans un rayon choisi de l'agent mort et qu'il n'est pas vacciné, on l'ajoute au vecteur 

        if abs(agent.x - mort.x) < rayon && abs(agent.y - mort.y) < rayon && !isvaccinated(agent)
            push!(popVoisins, agent)
        end
    end
    return popVoisins
end

# Fonction qui test une population et renvoie les agents qui ont testé positif aux test

function RATPopulation(pop::Population)
    global budget
    global depenseRAT
    popPositif = Agent[]

    # Boucle qui passe au travers de la population recu en argument, mais seulement ceux qui n'ont pas été test

    for agent in nottested(pop)

        # S'assure qu'on a assez de budget pour faire un RAT sur l'agent, sinon arrete les tests

        if budget > coutRAT

            # Enlève le cout du test

            budget -= coutRAT

            # Ajout le cout aux dépenses

            depenseRAT += coutRAT

            # Enregistre que cet agent a été testé pour ce tick, pour ne pas le retesté si plusieurs morts

            agent.tested = true

            # Enregistre l'événement de vaccination

            push!(eventsRAT, RATEvent(tick, agent.id, agent.x, agent.y))

            # Renvoie un vrai positif pour une probabilité de 'efficaciteRAT' si l'agent est infecté

            if efficaciteRAT > rand() && isinfectious(agent)
                push!(popPositif, agent)

            # Renvoie un faux positif pour une probabilité de 1 - 'efficaciteRAT' si l'agent est sain

            elseif efficaciteRAT < rand() && ishealthy(agent)
                push!(popPositif, agent)
            end
        else
            break
        end
    end
    return popPositif
end

# Fonction qui vaccine la population totale selon la population reçu en argument

function VaccinPopulation(popVaccin::Population)
    global budget
    global depenseVaccin
    for agent in popVaccin

        # S'assure qu'on a assez d'argent pour vacciner l'agent, sinon arrete les vaccinations

        if budget > coutVaccin

            # Enleve le cout du test

            budget -= coutVaccin

            # Ajout le cout aux dépenses

            depenseVaccin += coutVaccin

            # Enregistre l'énement de vaccination

            push!(eventsVac, VaccinationEvent(tick, agent.id, agent.x, agent.y))

            # Ajuste le temps de lattence avant que le vaccin fasse effet
        
            agent.vaccinationclock = 2
        else
            break
        end
    end
end

# Fonction qui note les voisins d'une population d'agents morts, les testent et vaccinent ceux qui sont positifs dans un rayon donné

function Vaccination(popMort::Population, rayon::Int)
    for mort in popMort
        VaccinPopulation(RATPopulation(VoisinsMort(mort, rayon)))
    end
end