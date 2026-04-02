# Fonction qui renvoie les voisins non vaccinés d'un agent mort dans un rayon choisi selon la distance
function VoisinsMort(mort::Agent, rayon::Integer)
    popVoisins = Agent[]
    for agent in population
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
    for agent in nottested(pop)
        # S'assure qu'on a assez de budget pour faire un RAT sur l'agent
        if budget > coutRAT
            # Enlève le cout du test
            budget -= coutRAT
            # Ajout le cout aux dépenses
            depenseRAT += coutRAT
            # Enregistre que cet agent a été testé pour ce tick, pour ne pas le retesté si plusieurs morts
            agent.tested = true
            # Enregistre l'événement de vaccination
            push!(eventsRAT, RATEvent(tick, agent.id, agent.x, agent.y))
            # Renvoie un vrai positif
            if efficaiteRAT > rand() && isinfectious(agent)
                push!(popPositif, agent)
                # Renvoie un faux positif
            elseif efficaiteRAT < rand() && ishealthy(agent)
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
        # S'assure qu'on a assez d'argent pour vacciner l'agent
        if budget > coutVaccin
            # Enleve le cout du test
            budget -= coutVaccin
            depenseVaccin += coutVaccin
            push!(eventsVac, VaccinationEvent(tick, agent.id, agent.x, agent.y))
            agent.vaccinationclock = 2
        else
            break
        end
    end
end

# Fonction qui fait notés les voisins d'une population d'agents morts, les testent et vaccinent ceux qui sont positifs
function VaccinationTime(popMort::Population, rayon::Int)
    for mort in popMort
        VaccinPopulation(RATPopulation(VoisinsMort(mort, rayon)))
    end
end