# Figure permettant d'observer le nombre de différents états des agents
function figureEtatSelonTemps(S, I, V)
    f = Figure()
    ax = Axis(f[1, 1]; xlabel="Génération", ylabel="Population")
    stairs!(ax, 1:tick, S, label="Susceptibles", color=:black)
    stairs!(ax, 1:tick, I, label="Infectieux", color=:red)
    stairs!(ax, 1:tick, V, label="Vaccinés", color=:blue)
    axislegend(ax)
    current_figure()
end


# Figure permettant de voir quand et où ont eu certains évenements
function figureEvent(events, typeevent::String)
    # Si events ne cpontient aucune valeur, affiche un message d'erreur
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
        @warn "Il n'y a aucune information enregistré dans l'event"
    end
end

# Figure permettant d'observer le budget et les dépenses
function figureBudget(budget, RAT, vaccin)
    f = Figure()
    ax = Axis(f[1, 1]; xlabel="Génération", ylabel="Dollards")
    stairs!(ax, 1:tick, budget, label="Argent restant", color=:green)
    stairs!(ax, 1:tick, RAT, label="Dépense RAT", color=:red)
    stairs!(ax, 1:tick, vaccin, label="Dépense Vaccin", color=:blue)
    axislegend(ax)
    current_figure()
end

# Histogramme qui renvoie la fréquence des valeurs contenue dans un vecteur
function histogramme(vecteur, titre::String)
    h = Figure()
    hist(h[1, 1], vecteur, color=:grey40, axis=(title="$titre", xlabel="Nombre d'Agent", ylabel="Fréquence"))
    current_figure()
end