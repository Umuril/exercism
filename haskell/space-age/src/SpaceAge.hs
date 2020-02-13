module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

ratioPlanetToEarth :: Planet -> Float
ratioPlanetToEarth Mercury = 0.2408467
ratioPlanetToEarth Venus = 0.61519726
ratioPlanetToEarth Earth = 1.0
ratioPlanetToEarth Mars = 1.8808158
ratioPlanetToEarth Jupiter = 11.862615
ratioPlanetToEarth Saturn = 29.447498
ratioPlanetToEarth Uranus = 84.016846
ratioPlanetToEarth Neptune = 164.79132

ageOn :: Planet -> Float -> Float
ageOn planet seconds = seconds / (ratioPlanetToEarth planet) / 31557600.0
