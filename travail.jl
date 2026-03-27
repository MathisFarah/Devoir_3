# ---
# title: Titre du travail
# repository: tpoisot/BIO245-modele
# auteurs:
#    - nom: Auteur
#      prenom: Premier
#      matricule: XXXXXXXX
#      github: premierAuteur
#    - nom: Auteur
#      prenom: Deuxième
#      matricule: XXXXXXXX
#      github: DeuxiAut
# ---

# # Introduction
# ## Mise en contexte
# ## Mise en contexte

# Alors, les maladies infectieuses peuvent se propager rapidement dans une population, surtout quand celle-ci ne possède pas une immunité déjà présente et est donc naive. Cela 
# peut même mener à un nombre très élevé de décès, surtout lorsque la maladie a beaucoup d'effets néfastes et est donc grâve et virulente. La vitesse de propagation de celle-ci
# dépend de divers variables comme le taux d’infection, la durée de la maladie chez un individu et des contacts entre individus. Il y a cependant des façons de contrer des 
# épidémies, comme la vaccination et le dépistage, qui permettent de réduire le nombre d’individus susceptibles d'être malades et permettent d’identifier les personnes 
# infectieuses afin d’intervenir de manière plus précise, et ce même sans symptômes appararents chez les individus. En contre partie, ces stratégies sont souvent limitées 
# par des contraintes, comme un budget, ce qui force parfoit de faire le choix entre tester davantage ou vacciner plus d'individus. C'est donc dans ce contexte que les modèles
# de simulation deviennent utiles pour comparer différentes stratégies et mieux comprendre leur impact sur la propagation d’une maladie.

# ## Questions

# Dans le modèle de dynamique épidémique de propagation d'une maladie infectieuses dans une population qui est naive, quelle stratégie, qui combine dépistage et vaccination, 
# permet de minimaliser la mortalité dans la population tout en respectant une contrainte de budget limité à 21 000$? 
# De plus, comment cette stratégie se compare à une situation où il y a absence d'interventation?

# ## Hypothèses et résultats attendus

# Donc, pour émettre certaines hypothèses, nous nous attendons qu'une stratégie de vaccination et dépistage va nécessairement réduire la mortalité par rapport à l'absence 
# d'intervention. Comme les individus infectieux sont asymptomatiques, il va falloir cibler une stratégie où les tests de dépistage vont permettre de mieux cibler la 
# vaccination et donc, d'être plus efficaces qu’une vaccination aléatoire seule sans dépistage pour ne pas dépasser notre budget. 

# Alors, l'efficacité de la stratégie va surtout dépendre de l'utilisation du budget qui est limité, ce qui implique donc d'avoir un certain compromis entre le nombre de tests
# et de vaccins. Il faut aussi garder en tête la variabilité des simulations vu que l’intervention débute seulement qu'après le premier décès et que le vaccin n’est actif 
# qu’après deux jours, donc une partie de la propagation devrait tout de même se faire de façons aléatoire. 

# On s’attend donc à une diminution de la mortalité grâce à notre stratégie, mais cela avec une certaine variabilité entre les simulations vu le caractère stochastique du modèle.

# # Présentation du modèle (Contraintes du modèle)

# ## Structure et dynamique épidémique

# Alors, le modèle simule la dynamique épidémique de la propagation d’une maladie infectieuse dans une population de 3750 individus qui sont initialement naïfs, donc sans aucune 
# immunité. Les individus sont répartis sur une lattice de taille -50, 50 sur les deux dimensions, il y aura donc des interactions entre voisins pour la propagation de la maladie.
# Donc, la transmission de la maladie dépend d’un taux d’infection fixé à des probabilité de devenir infectieux par contact de 0,4 lors des contacts entre individus sains et 
# infectieux. Une fois infecté, un individu reste infectieux pendant 21 jours qui finit toujours par le tuer au bout de ces 21 jours. Alors, un taux d'infection relativement 
# élevé et une durée de l'infection durant longtemps peuvent être typiques de maladies infectieuses fortement transmissibles. Cela peut alors entrainer une propagation rapide
# de la maladie dans une population qui est dite naive entre gens infectieux et ceux susceptibles de l'être par contact direct (Fraser et al, 2004).

# ## Vaccination et tests de dépistage

# Pour ce qui est du vaccin, celui-ci est entièrement efficace et donc les individus vaccinés ne peuvent plus être infectés et transmettent la maladie. Cependant, le vaccin 
# n'est actif que deux jours après son administration, il y a donc un délai dans la protection. Cela représente le temps nécessaire au développement d’une réponse immunitaire 
# après l’inoculation du vaccin, malgré que l'efficacité absolue de celui-ci est une simplification des vaccins qui ne sont jamais parfaits, mais souvent proche de l'être (ex:95%)
# (Polack et al, 2020). Les individus infectieux sont asymptomatiques, comme il est possible pour certaines maladies (He et al, 2020), donc il faut utiliser des tests de 
# dépistage antigéniqes rapides pour les détecter. Ces test ont une efficacité de 95%, mais ils ne permettent pas de connaître depuis combien de temps un individu est infecté. 
# Cela représente bien le fait que des tests antigéniqes rapides peuvent être imparfaits vu par exemple des faux négatifs (Scohy et al, 2020). On ne peut donc connaître 
# la prévalence de la maladie dans la population autrement que par des tests.

# ## Contraintes budgétaire et d'intervention

# Finalement, les interventions pour contrer la propagation de l'épidémie sont resstreintes par un budget total de 21 000$, chaque vaccin coûte 17$ et chaque test de dépistage
# coûte 4$. Une fois le budget épuisé, il n’est plus possible de tester ou de vacciner. Cela est courant en santé publique d'avoir à faire avec un budget limité ce qui limite 
# les ressources pour les mesures d'interventions pour contrer l'épidémie. Il faut donc optimiser les ressources disponibles pour limiter la propagation de la maladie et limité 
# la mortalité (Chalkidou et al, 2016). Finalement, les interventions pour contrer l'épidémie comme la vaccination et les tests ne peuvent commencer qu’après l’apparition du 
# premier décès dans la population. Cela représente le fait qu'il existe un délai entre la détection des premiers cas et le début des mesures d'interventions contre 
# l'épidémie (Peak et al, 2017).

# # Références

# Chalkidou, K., Glassman, A., Marten, R., Vega, J., Teerawattananon, Y., Tritasavit, N., Gyansa-Lutterodt, M., Seiter, A., Kieny, M. P., Hofman, K. et Culyer, A. J. (2016). 
# Priority-setting for achieving universal health coverage. _Bulletin of the World Health Organization_, 94(6), 462‑467. https://doi.org/10.2471/BLT.15.155721

# Fraser, C., Riley, S., Anderson, R. M. et Ferguson, N. M. (2004). Factors that make an infectious disease outbreak controllable. _Proceedings of the National Academy of 
# Sciences_, 101(16), 6146‑6151. https://doi.org/10.1073/pnas.0307506101

# He, X., Lau, E. H. Y., Wu, P., Deng, X., Wang, J., Hao, X., Lau, Y. C., Wong, J. Y., Guan, Y., Tan, X., Mo, X., Chen, Y., Liao, B., Chen, W., Hu, F., Zhang, Q., Zhong, M., Wu, 
# Y., Zhao, L., … Leung, G. M. (2020). Temporal dynamics in viral shedding and transmissibility of COVID-19. _Nature Medicine_, 26(5), 672‑675. 
# https://doi.org/10.1038/s41591-020-0869-5

# Peak, C. M., Childs, L. M., Grad, Y. H. et Buckee, C. O. (2017). Comparing nonpharmaceutical interventions for containing emerging epidemics. _Proceedings of the National 
#Academy of Sciences_, 114(15), 4023‑4028. https://doi.org/10.1073/pnas.1616438114

# Polack, F. P., Thomas, S. J., Kitchin, N., Absalon, J., Gurtman, A., Lockhart, S., Perez, J. L., Pérez Marc, G., Moreira, E. D., Zerbini, C., Bailey, R., Swanson, K. A., 
# Roychoudhury, S., Koury, K., Li, P., Kalina, W. V., Cooper, D., Frenck, R. W., Hammitt, L. L., … Gruber, W. C. (2020). Safety and Efficacy of the BNT162b2 mRNA Covid-19 
# Vaccine. _New England Journal of Medicine_, 383(27), 2603‑2615. https://doi.org/10.1056/NEJMoa2034577

# Scohy, A., Anantharajah, A., Bodéus, M., Kabamba-Mukadi, B., Verroken, A. et Rodriguez-Villalobos, H. (2020). Low performance of rapid antigen detection test as frontline
# testing for COVID-19 diagnosis. _Journal of Clinical Virology_, 129, 104455. https://doi.org/10.1016/j.jcv.2020.104455





# # Implémentation

# ## Packages nécessaires

import Random
Random.seed!(123456)
using CairoMakie

# ## Inclure du code

# Tous les fichiers dans le dossier `code` peuvent être ajoutés au travail
# final. C'est par exemple utile pour déclarer l'ensemble des fonctions du
# modèle hors du document principal.


# Le contenu des fichiers est inclus avec `include("code/nom_fichier.jl")`.

# Attention! Il faut que le code soit inclus au bon endroit (avant que les
# fonctions déclarées soient appellées).

# ## J'ai copié le code du modèle zombie ici, je ne sais pas si c'est au bon endroit mais bon le voici:
# # Concepts principaux

# ## Types

# Toutes les variables que nous avons manipulé jusqu'à présent ont un type:

typeof(2.0)

#-

typeof(2)

# Les types font partie d'une hiérarchie:

Float32 <: Number

#-

Float64 <: Real

# Comprendre les types des variables est important pour la performance du code.
# Par exemple, les deux opérations suivantes sont différentes:

2 + 2.0

#-

2.0 + 2.0

# On peut examiner les opérations nécessaires:

using InteractiveUtils
@code_typed 2 + 2.0

#-

@code_typed 2.0 + 2.0

# Notez que la première version demande une opération de plus, pour transformer
# `2` en `2.0`.

# On peut vérifier qu'une variable est d'un type particulier:

2 + 0.1im isa Number

#-

2 + 0.1im isa Real

#-

2 + 0.1im isa Complex

# ## Le dispatch

# Les fonctions peuvent être définies pour ne s'appliquer que sur certains types
# d'arguments. Par exemple, si on veut écrire une fonction qui mesure la
# diversité d'espèces à un site, on s'attend a trouver des données de type
# présence-absence:

prabs = rand(Bool, 10)
typeof(prabs)

# Le type de `prabs` est un type `Vector` avec un paramètre `Bool`. On peut
# utiliser cette information pour écrire notre fonction:

function diversité(presence::Vector{Bool})
    return sum(presence)
end

# Cette fonction ne va s'appliquer _que_ si on lui donne le type correct:

diversité(prabs)

# Si on essaie de l'appeller avec un type différent (ici `Vector{Int64}`), on
# obtient un message d'erreur:

diversité(rand(1:10, 50))

# Si on souhaite créer une fonction qui s'applique pour des données de taille de
# population, nous n'avons pas besoin de lui donner un autre nom! On peut
# ajouter une méthode à la fonction `diversité`, qui s'appliquera sur un autre
# type (ici, la mesure de diversité de Pielou):

function diversité(abondances::Vector{<:Real})
    p = abondances ./ sum(abondances)
    return -sum(p .* log.(p)) / log(length(p))
end

#-

diversité(rand(1:10, 50))

# Nous avons spécifié que cette méthode s'applique pour un vecteur qui contient
# des valeurs dont le type est un nombre réel. Notez que 

Bool <: Real

# Malgré ceci, _Julia_ va toujours utiliser la version la plus spécifique de la
# méthode. On peut vérifier quelles méthodes existents pour n'importe quelle
# fonction:

methods(diversité)

# ## Création de types

# Le système de types peut être étendu en créant ses propres types:

mutable struct MonType
    valeur
end

#-

MonType(2)

#-

MonType(2.0)

#-

m = MonType(true)
m.valeur

# On peut en fait aller plus loin, en permettant d'avoir des types qui aient des paramètres:

mutable struct MonAutreType{T1<:Number,T2<:Number}
    v1::T1
    v2::T2
end

# Cela permet de vérifier les arguments du type quand il est créé:

MonAutreType(2, 0.01)

# Le mot-clé `mutable` devant un type nous permet de changer sa valeur plus
# tard. Si il n'est pas présent, la variable sera immutable. Par exemple, c'est
# une bonne idée de stocker des paramètres de simulation dans un type immutable.

# On peut aussi donner des valeurs par défaut à un type:

Base.@kwdef mutable struct EncoreUnType{T<:AbstractFloat}
    x::T = zero(T)
    y::T = one(T)
end

# On a maintenant un type avec `x` et `y` qui valent, respectivement, 0 et 1
# dans le bon type:

EncoreUnType{Float32}()

# En utilisant le mécanisme de _dispatch_ mentionné plus haut, on peut donc
# écrire du code très expressif.

# *NB*: par convention, les types sont en `CamelCase`. Les conventions
# d'écriture sont dans le manuel de _Julia_.

# # Simulations

# Nous allons simuler le comportement d'une épidémie, qui se transmet par
# contact direct, et qui entraîne la mort après un intervale de temps fixe.

using CairoMakie
CairoMakie.activate!(px_per_unit=6.0)
using StatsBase
import Random

# Puisque nous allons identifier des agents, nous utiliserons des UUIDs pour
# leur donner un indentifiant unique:

import UUIDs
UUIDs.uuid4()

# ## Création des types

# Le premier type que nous avons besoin de créer est un agent. Les agents se
# déplacent sur une lattice, et on doit donc suivre leur position. On doit
# savoir si ils sont infectieux, et dans ce cas, combien de jours il leur reste:

Base.@kwdef mutable struct Agent
    x::Int64 = 0
    y::Int64 = 0
    clock::Int64 = 20
    infectious::Bool = false
    id::UUIDs.UUID = UUIDs.uuid4()
end

# On peut créer un agent pour vérifier:

Agent()

# La deuxième structure dont nous aurons besoin est un paysage, qui est défini
# par les coordonnées min/max sur les axes x et y:

Base.@kwdef mutable struct Landscape
    xmin::Int64 = -25
    xmax::Int64 = 25
    ymin::Int64 = -25
    ymax::Int64 = 25
end

# Nous allons maintenant créer un paysage de départ:

L = Landscape(xmin=-50, xmax=50, ymin=-50, ymax=50)

# ## Création de nouvelles fonctions

# On va commencer par générer une fonction pour créer des agents au hasard. Il
# existe une fonction pour faire ceci dans _Julia_: `rand`. Pour que notre code
# soit facile a comprendre, nous allons donc ajouter une méthode à cette
# fonction:

Random.rand(::Type{Agent}, L::Landscape) = Agent(x=rand(L.xmin:L.xmax), y=rand(L.ymin:L.ymax))
Random.rand(::Type{Agent}, L::Landscape, n::Int64) = [rand(Agent, L) for _ in 1:n]

# Cette fonction nous permet donc de générer un nouvel agent dans un paysage:

rand(Agent, L)

# Mais aussi de générer plusieurs agents:

rand(Agent, L, 3)

# On peut maintenant exprimer l'opération de déplacer un agent dans le paysage.
# Puisque la position de l'agent va changer, notre fonction se termine par `!`:

function move!(A::Agent, L::Landscape; torus=true)
    A.x += rand(-1:1)
    A.y += rand(-1:1)
    if torus
        A.y = A.y < L.ymin ? L.ymax : A.y
        A.x = A.x < L.xmin ? L.xmax : A.x
        A.y = A.y > L.ymax ? L.ymin : A.y
        A.x = A.x > L.xmax ? L.xmin : A.x
    else
        A.y = A.y < L.ymin ? L.ymin : A.y
        A.x = A.x < L.xmin ? L.xmin : A.x
        A.y = A.y > L.ymax ? L.ymax : A.y
        A.x = A.x > L.xmax ? L.xmax : A.x
    end
    return A
end

# Nous pouvons maintenant définir des fonctions qui vont nous permettre de nous
# simplifier la rédaction du code. Par exemple, on peut vérifier si un agent est
# infectieux:

isinfectious(agent::Agent) = agent.infectious

# Et on peut donc vérifier si un agent est sain:

ishealthy(agent::Agent) = !isinfectious(agent)

# On peut maintenant définir une fonction pour prendre uniquement les agents qui
# sont infectieux dans une population. Pour que ce soit clair, nous allons créer
# un _alias_, `Population`, qui voudra dire `Vector{Agent}`:

const Population = Vector{Agent}
infectious(pop::Population) = filter(isinfectious, pop)
healthy(pop::Population) = filter(ishealthy, pop)

# Nous allons enfin écrire une fonction pour trouver l'ensemble des agents d'une
# population qui sont dans la même cellule qu'un agent:

incell(target::Agent, pop::Population) = filter(ag -> (ag.x, ag.y) == (target.x, target.y), pop)

# ## Paramètres initiaux

# Notez qu'on peut réutiliser notre _alias_ pour écrire une fonction beaucoup plus
# expressive pour générer une population:

function Population(L::Landscape, n::Integer)
    return rand(Agent, L, n)
end

# On en profite pour simplifier l'affichage de cette population:

Base.show(io::IO, ::MIME"text/plain", p::Population) = print(io, "Une population avec $(length(p)) agents")

# Et on génère notre population initiale:

population = Population(L, 3750)

# Pour commencer la simulation, il faut identifier un cas index, que nous allons
# choisir au hasard dans la population:

rand(population).infectious = true

# Nous initialisons la simulation au temps 0, et nous allons la laisser se
# dérouler au plus 1000 pas de temps:

tick = 0
maxlength = 2000

# Pour étudier les résultats de la simulation, nous allons stocker la taille de
# populations à chaque pas de temps:

S = zeros(Int64, maxlength);
I = zeros(Int64, maxlength);

# Mais nous allons aussi stocker tous les évènements d'infection qui ont lieu
# pendant la simulation:

struct InfectionEvent
    time::Int64
    from::UUIDs.UUID
    to::UUIDs.UUID
    x::Int64
    y::Int64
end

events = InfectionEvent[]

# Notez qu'on a contraint notre vecteur `events` a ne contenir _que_ des valeurs
# du bon type, et que nos `InfectionEvent` sont immutables.

# ## Simulation

while (length(infectious(population)) != 0) & (tick < maxlength)

    ## On spécifie que nous utilisons les variables définies plus haut
    global tick, population

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

# ## Analyse des résultats

# ### Série temporelle

# Avant toute chose, nous allons couper les séries temporelles au moment de la
# dernière génération:

S = S[1:tick];
I = I[1:tick];

#-

f = Figure()
ax = Axis(f[1, 1]; xlabel="Génération", ylabel="Population")
stairs!(ax, 1:tick, S, label="Susceptibles", color=:black)
stairs!(ax, 1:tick, I, label="Infectieux", color=:red)
axislegend(ax)
current_figure()

# ### Nombre de cas par individu infectieux

# Nous allons ensuite observer la distribution du nombre de cas créés par chaque
# individus. Pour ceci, nous devons prendre le contenu de `events`, et vérifier
# combien de fois chaque individu est représenté dans le champ `from`:

infxn_by_uuid = countmap([event.from for event in events]);

# La commande `countmap` renvoie un dictionnaire, qui associe chaque UUID au
# nombre de fois ou il apparaît:

# Notez que ceci nous indique combien d'individus ont été infectieux au total:

length(infxn_by_uuid)

# Pour savoir combien de fois chaque nombre d'infections apparaît, il faut
# utiliser `countmap` une deuxième fois:

nb_inxfn = countmap(values(infxn_by_uuid))

# On peut maintenant visualiser ces données:

f = Figure()
ax = Axis(f[1, 1]; xlabel="Nombre d'infections", ylabel="Nombre d'agents")
scatterlines!(ax, [get(nb_inxfn, i, 0) for i in Base.OneTo(maximum(keys(nb_inxfn)))], color=:black)
f

# ### Hotspots

# Nous allons enfin nous intéresser à la propagation spatio-temporelle de
# l'épidémie. Pour ceci, nous allons extraire l'information sur le temps et la
# position de chaque infection:

t = [event.time for event in events];
pos = [(event.x, event.y) for event in events];

#

f = Figure()
ax = Axis(f[1, 1]; aspect=1, backgroundcolor=:grey97)
hm = scatter!(ax, pos, color=t, colormap=:navia, strokecolor=:black, strokewidth=1, colorrange=(0, tick), markersize=6)
Colorbar(f[1, 2], hm, label="Time of infection")
hidedecorations!(ax)
current_figure()

# # Modifications possibles

# Pendant le cours, formulez des hypothèses sur l'effet de 

# - la taille du paysage
# - la taille de la population
# - la dispersion sur une lattice toroïdale
# - la durée de l'épidémie
# - la survie de la population

# Étudiez le code en profondeur avant de commencer. Est-ce que certains
# paramètres sont représentés par des _magic numbers_ qui devraient être rendu
# explicites?

# Testez ces hypothèses en variant les paramètres du modèle. Est-ce qu'il existe
# des situations dans lesquelles la population est protégée contre l'épidémie?
# Des situations dans laquelle la structure spatiale de l'épidémie change?

# # Figures supplémentaires

# Visualisation des infections sur l'axe x

scatter(t, first.(pos), color=:black, alpha=0.5)

# et y

scatter(t, last.(pos), color=:black, alpha=0.5)

include("code/01_test.jl")

# ## Une autre section

"""
    foo(x, y)

Cette fonction ne fait rien.
"""
function foo(x, y)
    ## Cette ligne est un commentaire
    return nothing
end

# # Présentation des résultats

# La figure suivante représente des valeurs aléatoires:

hist(randn(1000), color=:grey80)

# # Discussion

# On peut aussi citer des références dans le document `references.bib`, qui doit
# être au format BibTeX. Les références peuvent être citées dans le texte avec
# `@` suivi de la clé de citation. Par exemple: @ermentrout1993cellular -- la
# bibliographie sera ajoutée automatiquement à la fin du document.

# Le format de la bibliographie est American Physics Society, et les références
# seront correctement présentées dans ce format. Vous ne devez/pouvez pas éditer
# la bibliographie à la main.
