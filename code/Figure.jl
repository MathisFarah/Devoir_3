"""
    function figureEtatSelonTemps(S, I, V)

Figure permettant d'observer le nombre de différents états des agents à travers le temps

S : vecteur contenant le nombre d'agent sains pour chaque tick
I : vecteur contenant le nombre d'agent infectés pour chaque tick
V : vecteur contenant le nombre d'agent vaccinés pour chaque tick
"""

function figureEtatSelonTemps(S, I, V)
    f = Figure()
    ax = Axis(f[1, 1]; xlabel="Générations", ylabel="Population")
    stairs!(ax, 1:tick, S, label="Susceptibles", color=:black)
    stairs!(ax, 1:tick, I, label="Infectieux", color=:red)
    stairs!(ax, 1:tick, V, label="Vaccinés", color=:blue)
    axislegend(ax)
    current_figure()
end

"""
    function figureEvent(events, typeevent::String)

Figure permettant de voir quand et où ont eu lieux certains évenements

events : object contenant tous les infromations des évenements d'un certain type
typeevent : Séries de caractères contenant le type d'event observé pour le titre de la figure
"""

function figureEvent(events, typeevent::String)
    # Si events ne contient aucune valeur, affiche un message d'erreur
    if length(events) > 0
        t = [event.time for event in events]
        pos = [(event.x, event.y) for event in events]

        f = Figure()
        ax = Axis(f[1, 1]; aspect=1, backgroundcolor=:grey97)
        hm = scatter!(ax, pos, color=t, colormap=:navia, strokecolor=:black, strokewidth=1, colorrange=(0, tick), markersize=6)
        Colorbar(f[1, 2], hm, label="Time of $typeevent")
        hidedecorations!(ax)
        current_figure()
    else
        @warn "Il n'y a aucune information enregistrée dans l'event"
    end
end

"""
    function figureBudget(budget, RAT, vaccin)

Figure permettant d'observer le budget et les dépenses à travers le temps

budget : vecteur contenant l'argent restant pour chaque tick
RAT : vecteur contenant les dépenses des tests RAT pour chaque tick
vaccin : vecteur contenant les dépenses des vaccins pour chaque tick
"""

function figureBudget(budget, RAT, vaccin)
    f = Figure()
    ax = Axis(f[1, 1]; xlabel="Générations", ylabel="Dollards")
    stairs!(ax, 1:tick, budget, label="Argents restants", color=:green)
    stairs!(ax, 1:tick, RAT, label="Dépenses RAT", color=:red)
    stairs!(ax, 1:tick, vaccin, label="Dépenses Vaccins", color=:blue)
    axislegend(ax)
    current_figure()
end

"""
    function histogramme(vecteur, titre::String)


Histogramme qui renvoie la fréquence des valeurs contenue dans un vecteur

vecteur : une série de valeur qui sera utilisé dans l'histogrammme
titre : séries de caractères qui contient le titre pour l'histogramme, dépend du vecteur envoyé
"""

function histogramme(vecteur, titre::String)
    h = Figure()
    hist(h[1, 1], vecteur, color=:grey40, axis=(title="$titre", xlabel="Nombre d'Argents", ylabel="Fréquences"))
    current_figure()
end