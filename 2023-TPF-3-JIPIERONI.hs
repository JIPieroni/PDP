{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use record patterns" #-}
{-# HLINT ignore "Eta reduce" #-}
import Text.Read (Lexeme(String))
{-# HLINT ignore "Redundant ==" #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Redundant section" #-}



data Persona = UnaPersona {
    nombre::String,
    impuestos::String,
    cantautos:: [Auto] } deriving (Show, Eq)
    

data Auto = UnAuto {
    marca::String,
    modelo:: Int ,
    kilometraje:: Int } deriving (Show, Eq, Ord)


ferrari, fitito, reno, bmw :: Auto

ferrari = UnAuto "ferrari" 1990 100
fitito =  UnAuto "fiat" 1960 10000000
reno = UnAuto "renault" 2023 0
bmw = UnAuto "bmw-21" 2001 50000

susi, kari, alber, augus, pepe :: Persona
susi = UnaPersona "Susana" "si" [ferrari, reno]
kari = UnaPersona "Karina" "si" [fitito, ferrari, reno]
alber = UnaPersona "Alberto" "no" [ferrari, bmw]
augus = UnaPersona "Augusto" "si" [fitito, reno]
pepe= UnaPersona "Pedro" "no" [bmw, reno]       


listaP :: [Persona] 
listaP = [susi, kari, alber, augus, pepe] 

esHonesto:: Persona -> Bool
esHonesto (UnaPersona _ imp _) = imp == "si"


valorAuto :: Persona -> Int
valorAuto (UnaPersona _ _ [a, b]) = modelo a + kilometraje a + modelo b + kilometraje b 
valorAuto (UnaPersona _ _ [a, b, c]) = modelo a + kilometraje a + modelo b + kilometraje b + modelo c + kilometraje c

primLista :: [Persona] -> Persona
primLista listaP = head listaP


esMillonario :: Persona -> Bool
esMillonario (UnaPersona n imp [a, b]) = (valorAuto (UnaPersona n imp [a, b])) > 1000000
esMillonario (UnaPersona n imp [a, b, c]) = (valorAuto (UnaPersona n imp [a, b, c])) > 1000000




esMillonarioHonesto :: Persona -> Bool
esMillonarioHonesto (UnaPersona n imp c) = esHonesto (UnaPersona n imp c) && esMillonario (UnaPersona n imp c)
