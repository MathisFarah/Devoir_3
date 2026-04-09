# Création de différents types afin de stocker les événements d'infections, de vaccinations et RAT

struct InfectionEvent
    time::Int64
    from::UUIDs.UUID
    to::UUIDs.UUID
    x::Int64
    y::Int64
end

struct VaccinationEvent
    time::Int64
    who::UUIDs.UUID
    x::Int64
    y::Int64
end

struct RATEvent
    time::Int64
    who::UUIDs.UUID
    x::Int64
    y::Int64
end