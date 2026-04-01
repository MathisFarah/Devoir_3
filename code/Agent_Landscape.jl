# Le premier type que nous avons besoin de créer est un agent. Les agents se
# déplacent sur une lattice, et on doit donc suivre leur position. On doit
# savoir si ils sont infectieux, et dans ce cas, combien de jours il leur reste:

"""
Représente un individu dans la simulation.

Attributs :
- x, y : position de l'individu sur la grille
- clock : nombre de jours restants avant la mort
- infectious : indique si l'individu est infecté et contagieux
- id : identifiant unique

Biologiquement, un individu infecté voit son état se dégrader
jusqu'à atteindre 0 (mort).
"""

Base.@kwdef mutable struct Agent
    x::Int64 = 0
    y::Int64 = 0
    infectionclock::Int64 = 21
    vaccinationclock::Int64 = 0
    infectious::Bool = false
    vaccinated::Bool = false
    tested::Bool = false
    id::UUIDs.UUID = UUIDs.uuid4()
end

# La deuxième structure dont nous aurons besoin est un paysage, qui est défini
# par les coordonnées min/max sur les axes x et y:

"""
Définit l'environnement spatial de la simulation.

Attributs :
- xmin, xmax : limites horizontales
- ymin, ymax : limites verticales

Les individus se déplacent à l'intérieur de cet espace,
ce qui influence la propagation de la maladie.
"""

Base.@kwdef mutable struct Landscape
    xmin::Int64 = -25
    xmax::Int64 = 25
    ymin::Int64 = -25
    ymax::Int64 = 25
end

# On peut maintenant exprimer l'opération de déplacer un agent dans le paysage.
# Puisque la position de l'agent va changer, notre fonction se termine par `!`:

"""
Déplace un individu aléatoirement dans la grille.

L'individu peut se déplacer d'une case dans chaque direction.
Si "torus" est activé, les bords sont connectés.

Biologiquement cela représente les déplacements des individus,
qui permettent les contacts et la transmission de la maladie.
"""
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

"""
Crée une population de n individus placés aléatoirement
dans le paysage.
"""
const Population = Vector{Agent}

function Population(L::Landscape, n::Integer)
    return rand(Agent, L, n)
end
