# Création de différent type afin de stocker les évenemnts d'infection, de vaccination et RAT

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