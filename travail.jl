# ---
# title: Dynamique épidémique
# repository: MathisFarah/Devoir_3
# auteurs:
#    - nom: Farah-Lajoie
#      prenom: Mathis
#      matricule: 20280102
#      github: MathisFarah
#    - nom: Moreau
#      prenom: Maxim
#      matricule: 20269875
#      github: Max80780
#    - nom: Menia
#      prenom: Myriam
#      matricule: 20281484
#      github: Myriam7865
# ---
# # Introduction
# ## Mise en contexte

# Alors, les maladies infectieuses peuvent se propager rapidement dans une population, surtout quand celle-ci ne possède pas une immunité déjà présente et est donc naive 
# @fraser2004. Cela peut même mener à un nombre très élevé de décès, surtout lorsque la maladie a beaucoup d'effets néfastes et est donc grâve et virulente 
# @jones2008. La vitesse de propagation de celle-ci dépend de divers variables comme le taux d’infection, la durée de la maladie chez un individu et des contacts 
# entre individus @hethcote2000. Il y a cependant des façons de contrer des épidémies, comme la vaccination et le dépistage, qui permettent de réduire le nombre d’individus 
# susceptibles d'être malades et permettent d’identifier les personnes infectieuses afin d’intervenir de manière plus précise, et ce même sans symptômes appararents chez les 
# individus @he2020. En contre partie, ces stratégies sont souvent limitées par des contraintes, comme un budget @chalkidou2016, ce qui force parfoit de faire
# le choix entre tester davantage ou vacciner plus d'individus. C'est donc dans ce contexte que les modèles de simulation deviennent utiles pour comparer différentes stratégies 
# et mieux comprendre leur impact sur la propagation d’une maladie @hethcote2000.

# ## Questions

# Dans le modèle de dynamique épidémique de propagation d'une maladie infectieuses dans une population qui est naive, quelle stratégie, qui combine dépistage et vaccination, 
# permet de minimaliser la mortalité dans la population tout en respectant une contrainte de budget limité à 21 000$? 
# De plus, comment cette stratégie se compare à une situation où il y a absence d'intervention?

# ## Hypothèses et résultats attendus

# Donc, pour émettre certaines hypothèses, nous nous attendons qu'une stratégie de vaccination et dépistage va nécessairement réduire la mortalité par rapport à l'absence 
# d'intervention. Comme les individus infectieux sont asymptomatiques, il va falloir cibler une stratégie où les tests de dépistage vont permettre de mieux cibler la 
# vaccination et donc, d'être plus efficaces qu’une vaccination aléatoire seule sans dépistage pour ne pas dépasser notre budget. 

# Alors, l'efficacité de la stratégie va surtout dépendre de l'utilisation du budget qui est limité, ce qui implique donc d'avoir un certain compromis entre le nombre de tests
# et de vaccins. Il faut aussi garder en tête la variabilité des simulations vu que l’intervention débute seulement qu'après le premier décès et que le vaccin n’est actif 
# qu’après deux jours, donc une partie de la propagation devrait tout de même se faire de façons aléatoire. 

# On s’attend donc à une diminution de la mortalité grâce à notre stratégie, mais cela avec une certaine variabilité entre les simulations vu la stochasticité du modèle.

# # Présentation du modèle (Contraintes du modèle)

# ## Structure et dynamique épidémique

# Alors, le modèle simule la dynamique épidémique de la propagation d’une maladie infectieuse dans une population de 3750 individus qui sont initialement naïfs, donc sans aucune 
# immunité. Les individus sont répartis sur une lattice de taille -50, 50 sur les deux dimensions, il y aura donc des interactions entre voisins pour la propagation de la maladie.
# Donc, la transmission de la maladie dépend d’un taux d’infection fixé à des probabilité de devenir infectieux par contact de 0,4 lors des contacts entre individus sains et 
# infectieux. Une fois infecté, un individu reste infectieux pendant 21 jours qui finit toujours par le tuer au bout de ces 21 jours. Alors, un taux d'infection relativement 
# élevé et une durée de l'infection durant longtemps peuvent être typiques de maladies infectieuses fortement transmissibles. Cela peut alors entrainer une propagation rapide
# de la maladie dans une population qui est naive entre gens infectieux et ceux susceptibles de l'être par contact @fraser2004.

# ## Vaccination et tests de dépistage

# Pour ce qui est du vaccin, celui-ci est entièrement efficace et donc les individus vaccinés ne peuvent plus être infectés et transmettent la maladie. Cependant, le vaccin 
# n'est actif que deux jours après son administration, il y a donc un délai dans la protection. Cela représente le temps nécessaire au développement d’une réponse immunitaire 
# après l’inoculation du vaccin, malgré que l'efficacité absolue de celui-ci est une simplification des vaccins qui ne sont jamais parfaits, mais souvent proche de l'être (ex:95%)
# @polack2020. Les individus infectieux sont asymptomatiques, comme il est possible pour certaines maladies @he2020, donc il faut utiliser des tests de 
# dépistage antigéniqes rapides pour les détecter. Ces test ont une efficacité de 95%, mais ils ne permettent pas de connaître depuis combien de temps un individu est infecté. 
# Cela représente bien le fait que des tests antigéniqes rapides peuvent être imparfaits vu par exemple des faux négatifs @scohy2020. On ne peut donc connaître 
# la prévalence de la maladie dans la population autrement que par des tests.

# ## Contraintes budgétaire et d'intervention

# Finalement, les interventions pour contrer la propagation de l'épidémie sont resstreintes par un budget total de 21 000$, chaque vaccin coûte 17$ et chaque test de dépistage
# coûte 4$. Une fois le budget épuisé, il n’est plus possible de tester ou de vacciner. Cela est courant en santé publique d'avoir à faire avec un budget limité ce qui limite 
# les ressources pour les mesures d'interventions pour contrer l'épidémie. Il faut donc optimiser les ressources disponibles pour limiter la propagation de la maladie et limité 
# la mortalité @chalkidou2016. Finalement, les interventions pour contrer l'épidémie comme la vaccination et les tests ne peuvent commencer qu’après l’apparition du 
# premier décès dans la population. Cela représente le fait qu'il existe un délai entre la détection des premiers cas et le début des mesures d'interventions contre 
# l'épidémie @peak2017.

# # Stratégie de dépistage et vaccination

# Alors, l'intervention va commencer dès qu'un premier individu meurt dans la population, ce qui indique alors que la maladie est déjà présente dans la population. 
# À partir de ce moment, on effectue des tests RAT dans un rayon de 21 cellules autour de cet individu. Cela en raison que le rayon correspond à la durée de la maladie
# durant laquelle un individu peut infecté un autre individu, donc le rayon représente la zone où la maladie a le plus de chances de s’être propagée.

# Par la suite, les individus qui sont testés positifs dans ce rayon vont être vaccinés. Même si le vaccin est actif qu'après deux générations, cela permet quand même de limiter
# rapidement la transmission de la maladie vu qu'on empêche les individus vaccinés de devenir ou de rester infectieux. Ce même processus est répété à chaque fois qu'un nouvel
# individu décède, on va alors tester encore dans un rayon de 21 à chaque fois puis vacciner les positifs. Cela permet donc de suivre la propagation de la maladie et de concentrer
# les efforts de tests et vaccinations dans les zones qui sont plus à risques, tout cela en évitant le plus possible de tester inutilement l’ensemble de la population et de 
# dépasser le budget. 

# # Modifications du modèle (justification biologique)

# Alors, pour mettre en place la stratégie, il a fallu modifié certaines choses du modèle pour intégrer des mécanismes biologiques supplémentaires. Un état vacciné a été ajouté 
# aux agents, qui permet de représenter les individus protégés contre l'infection après le délai de deux générations. Ce délai correspond au temps qui faut pour développer une 
# réponse immunitaire, après cela il ne peut plus transmettre et être infecté par la maladie. 

# Par la suite, un mécanisme est également ajouté afin de détecter les individus infectieux asymptomatiques. Vu qu'ils ne présentent aucun symptômes, le test est le seul moyen
# de les identifier. L’efficacité du test (95 %) introduit une petite incertitude, ce qui représente la présence de faux négatifs et de faux positifs en conditions réelles.
# De plus, la propagation de la maladie se fait via des contacts directs entre individus partageant la même position, donc cela justifie l’utilisation d’un dépistage ciblé 
# dans un rayon donné de 21 autour des individus morts. Les individus testés positifs dans ce rayon de 21 vont être vaccinés, donc leur état va changer, pour qu'ils ne puissent
# plus infectés ou mourir de la maladie après 2 jours. Le rayon de 21 est le temps de 21 jours avant qu'un individu décède de la maladie, donc le déplacement qu'il peut faire
# avant qu'il meurt où il peut propager la maladie à d'autres. Cela correspond à un délai plausible pour qu'une maladie infectieuse et sévère cause la mort des gens infectés.

# # Implémentation

# ## Packages nécessaires

# Initialisation du générateur aléatoire pour garantir la reproductibilité des simulations
import Random
Random.seed!(123456)

# Librairie utilisée pour la visualisation des résultats (graphiques)
using CairoMakie
CairoMakie.activate!(px_per_unit=6.0)
using StatsBase

# Puisque nous allons identifier des agents, nous utiliserons des UUIDs pour leur donner un indentifiant unique:
import UUIDs
UUIDs.uuid4()

# ## Inclure du code

include("code/Agent_Landscape.jl")
include("code/Figure.jl")
include("code/RAT_Vaccin.jl")
include("code/Event.jl")

# # Simulations

# Nous allons simuler le comportement d'une épidémie, qui se transmet par
# contact direct, et qui entraîne la mort après un intervale de temps fixe.

# Nous allons maintenant créer un paysage de départ:

L = Landscape(xmin=-50, xmax=50, ymin=-50, ymax=50)

# ## Création de nouvelles fonctions

# On va commencer par générer une fonction pour créer des agents au hasard. Il
# existe une fonction pour faire ceci dans _Julia_: `rand`. Pour que notre code
# soit facile a comprendre, nous allons donc ajouter une méthode à cette
# fonction:

Random.rand(::Type{Agent}, L::Landscape) = Agent(x=rand(L.xmin:L.xmax), y=rand(L.ymin:L.ymax))
Random.rand(::Type{Agent}, L::Landscape, n::Int64) = [rand(Agent, L) for _ in 1:n]

# Nous pouvons maintenant définir des fonctions qui vont nous permettre de nous
# simplifier la rédaction du code. 

# Vérifie si un individu est infectieux (malade et contagieux)
isinfectious(agent::Agent) = agent.infectious

# Et on peut donc vérifier si un agent est sain:

ishealthy(agent::Agent) = !isinfectious(agent) && !isvaccinated(agent)

# Vérifie si un agent est vaccinated

isvaccinated(agent::Agent) = agent.vaccinated

# Vérifie si un agent est testé

isnottested(agent::Agent) = !agent.tested

# On peut maintenant définir une fonction pour prendre uniquement les agents qui
# sont infectieux dans une population. Pour que ce soit clair, nous allons créer
# un _alias_, `Population`, qui voudra dire `Vector{Agent}`:

# Retourne les individus d'un certains états d'une population

infectious(pop::Population) = filter(isinfectious, pop)
healthy(pop::Population) = filter(ishealthy, pop)
vaccinated(pop::Population) = filter(isvaccinated, pop)
nottested(pop::Population) = filter(isnottested, pop)

# Nous allons enfin écrire une fonction pour trouver l'ensemble des agents d'une
# population qui sont dans la même cellule qu'un agent:

"""
Retourne les individus présents dans la même cellule qu'un agent.

Paramètres :
- target : agent cible
- pop : population

Retour :
- Liste des agents au même endroit

Biologiquement, cela représente les contacts directs
nécessaires à la transmission.
"""

incell(target::Agent, pop::Population) = filter(ag -> (ag.x, ag.y) == (target.x, target.y), pop)

# ## Paramètres initiaux

# On en profite pour simplifier l'affichage de cette population:

Base.show(io::IO, ::MIME"text/plain", p::Population) = print(io, "Une population avec $(length(p)) agents")

nbSim = 50
mortFinale = zeros(Int, nbSim)
mortSansIntervention = zeros(Int, nbSim)
coutFinale = zeros(Int, nbSim)

taillepop = 3750
population = Population()
tick = 0
maxlength = 2000
budget = 21_000
coutRAT = 4
coutVaccin = 17
depenseRAT = 0
depenseVaccin = 0
efficaciteRAT = 0.95

# Pour étudier les résultats de la simulation, nous allons stocker la taille de
# populations à chaque pas de temps:

S = zeros(Int64, maxlength)
I = zeros(Int64, maxlength)
V = zeros(Int64, maxlength)

## Pour étudier comment l'argent est dépensé

budgetVecteur = zeros(Int64, maxlength)
depenseRATVecteur = zeros(Int64, maxlength)
depenseVaccinVecteur = zeros(Int64, maxlength)

## Mais nous allons aussi stocker tous les évènements d'infections, vaccinations et RAT qui ont lieu
## pendant la simulation:

eventsInf = InfectionEvent[]
eventsVac = VaccinationEvent[]
eventsRAT = RATEvent[]

# Simulation sans intervention 

for i in 1:nbSim

    while (length(infectious(population)) != 0) & (tick < maxlength)

        ## On spécifie que nous utilisons les variables définies plus haut
        global tick = 0
        global S = zeros(Int64, maxlength)
        global I = zeros(Int64, maxlength)
        global population = Population(L, taillepop)


        tick += 1

        ## Movement
        for agent in population
            move!(agent, L; torus=false)
        end

        ## Infection
        for agent in Random.shuffle(infectious(population))
            neighbors = healthy(incell(agent, population))
            for neighbor in neighbors
                if rand() <= 0.4
                    neighbor.infectious = true
                    push!(events, InfectionEvent(tick, agent.id, neighbor.id, agent.x, agent.y))
                end
            end
        end

        ## Change in survival
        for agent in infectious(population)
            agent.clock -= 1
        end

        ## Remove agents that died
        population = filter(x -> x.clock > 0, population)

        ## Store population size
        S[tick] = length(healthy(population))
        I[tick] = length(infectious(population))

    end

    mortSansIntervention[i] = taillepop - length(population)

end

sansIntervention = histogramme(mortSansIntervention, "Nombre d'agents mort sans intervention")
# Simulation avec intervention 

for i in 1:nbSim

    ## Réinitialse les valeurs de ces paramètres avant chaque simulation
    global tick = 0
    global budget = 21_000
    global depenseRAT = 0
    global depenseVaccin = 0
    global eventsInf = InfectionEvent[]
    global eventsVac = VaccinationEvent[]
    global eventsRAT = RATEvent[]
    global S = zeros(Int64, maxlength)
    global I = zeros(Int64, maxlength)
    global V = zeros(Int64, maxlength)
    global budgetVecteur = zeros(Int64, maxlength)
    global depenseRATVecteur = zeros(Int64, maxlength)
    global depenseVaccinVecteur = zeros(Int64, maxlength)

    ## On génère notre population aléatoire initaile:

    global population = Population(L, taillepop)

    ## Sélection aléatoire d'un individu initialement infecté (cas index)

    rand(population).infectious = true

    ## Simulation

    while (length(infectious(population)) != 0) & (tick < maxlength)

        ## On spécifie que nous utilisons les variables définies plus haut

        global tick, population, budget, depenseRAT, depenseVaccin, eventsInf, eventsVac, eventsRAT

        tick += 1

        ## Mouvement de chaque individu ainsi que réinitialise son état à non-testé

        for agent in population
            move!(agent, L; torus=false)
            agent.tested = false
        end

        ## Transmission de la maladie : Les individus infectieux peuvent contaminer les individus sains
        ## présents dans la même cellule avec une probabilité de 0.4    
        ## Infection

        for agent in Random.shuffle(infectious(population))
            neighbors = healthy(incell(agent, population))
            for neighbor in neighbors

                ## Infecté par une probabilité de 0,4 ET s'il n'est pas vacciné

                if rand() <= 0.4 && !isvaccinated(neighbor)
                    neighbor.infectious = true
                    push!(eventsInf, InfectionEvent(tick, agent.id, neighbor.id, agent.x, agent.y))
                end
            end
        end

        ## Progression de la maladie : Le temps de vie avant la mort diminue pour chaque individu infecté
        ## Change in survival

        for agent in infectious(population)
            agent.infectionclock -= 1
        end

        ## Note tous les agents qui sont morts ce tick

        popMort = filter(x -> x.infectionclock == 0, population)

        ## Suppression des individus morts : Les individus dont le temps est écoulé sont retirés de la population

        population = filter(x -> x.infectionclock > 0, population)

        ## Change l'état de l'agent à vacciner et non-infecté lorsque la vaccin commence à faire effet


        ## Réinitialse l'état de l'agent non-testé s'il a été testé au tick précédent
        ## Si le temps de latence du vaccin est supérieur à 0, on le décrémente
        ## Si le temps de latence du vaccin atteint 0, la personne devient vacciné et perd son état d'infecté si elle l'était

        for agent in population
            if agent.vaccinationclock > 0
                agent.vaccinationclock -= 1
                if agent.vaccinationclock == 0
                    agent.vaccinated = true
                    agent.infectious = false
                end
            end
        end

        ## S'il reste du budget, fait une vaccination et RAT des agents lorsqu'il y a un mort

        if budget > coutRAT && length(popMort) > 0
            Vaccination(popMort, 21)
        end


        ## Enregistrement des données : Stock le nombre d'individus sains et infectés à chaque instant

        S[tick] = length(healthy(population))
        I[tick] = length(infectious(population))
        V[tick] = length(vaccinated(population))

        ## Enregistrement des données : Stock les dépenses de chaque instant

        budgetVecteur[tick] = budget
        depenseRATVecteur[tick] = depenseRAT
        depenseVaccinVecteur[tick] = depenseVaccin


    end

    ## Coupe la longueur des informations au dernier tick où de l'infromation à été enregistré

    S = S[1:tick]
    I = I[1:tick]
    V = V[1:tick]
    budgetVecteur = budgetVecteur[1:tick]
    depenseRATVecteur = depenseRATVecteur[1:tick]
    depenseVaccinVecteur = depenseVaccinVecteur[1:tick]

    ## Enregistre le nombre de mort ainsi que le coût total à la fin de la simulation
    mortFinale[i] = taillepop - length(population)
    coutFinale[i] = budgetVecteur[1] - budget

end
# ## Analyse des résultats

# Figure 1 : Représentation graphique des dépenses et du budget d'une seule simluation à travers le temps

figureBudget(budgetVecteur, depenseRATVecteur, depenseVaccinVecteur)

# Figure 2 : Représentation graphique des différents états des agents à travers le temps

figureEtatSelonTemps(S, I, V)

# Figure 3 : Histogramme du nombre d'agents morts à la fin de 250 simulations sans intervention

sansIntervention

# Figure 4 : Histogramme du nombre d'agents morts à la fin de 250 simulations avec vaccination

histogramme(mortFinale, "Nombre d'agents morts avec vaccination")

# Figure 5 : Histogramme du coût total à la fin de 250 simulations

histogramme(coutFinale, "Dépenses")

# # Présentation des résultats


# # Discussion

# On peut aussi citer des références dans le document `references.bib`, qui doit
# être au format BibTeX. Les références peuvent être citées dans le texte avec
# `@` suivi de la clé de citation. Par exemple: @ermentrout1993cellular -- la
# bibliographie sera ajoutée automatiquement à la fin du document.

# Le format de la bibliographie est American Physics Society, et les références
# seront correctement présentées dans ce format. Vous ne devez/pouvez pas éditer
# la bibliographie à la main