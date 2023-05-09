


data Participantes = UnParticipante {
    nombre :: String,
    nombrePadre :: String,
    habilidades :: (Float,Float) } deriving (Show, Eq)

bart, todd, rafa ::  Participantes

bart = UnParticipante "Bart" "Homero" (25,60)
todd = UnParticipante "Todd" "Ned" (15,80)
rafa = UnParticipante "Rafa" "Gorgory" (10,1)

data Tiro = UnTiro {
    velocidad:: Float, 
    precision :: Float,
    altura :: Float} deriving (Show, Eq)

newtype Obstaculo = UnObstaculo {obstaculo :: (Tiro -> Bool, Tiro -> Tiro) }





laguna :: Float -> Obstaculo
laguna x= UnObstaculo ((\(UnTiro v p a) -> v>80 && between 10 50 a) , (\(UnTiro v p a) -> (UnTiro (v / x) (p / x) (a / x))))

tunelConRampita :: Obstaculo
tunelConRampita = UnObstaculo ((\(UnTiro v p a) -> p > 90 && a==0),(\(UnTiro v p a) -> (UnTiro (v*2) 100 0 )))

hoyo :: Obstaculo 
hoyo = UnObstaculo ((\(UnTiro v p a) -> between 5 20 v && p > 95 && a == 0), (\(UnTiro _ _ _) -> UnTiro 0 0 0))



between n m x = elem x [n .. m]

maximoSegun f = foldl1 (mayorSegun f)
mayorSegun f a b | f a >= f b = a
                 | otherwise = b


palos = [putter, madera, hierro]

paloQueNoExiste :: Tiro
paloQueNoExiste = UnTiro 0 0 0

putter :: Participantes -> Tiro -> Tiro
putter (UnParticipante _ _ h) (UnTiro v p a) = UnTiro 10 (2 * snd h) 0


madera :: Participantes -> Tiro -> Tiro
madera (UnParticipante _ _ h) (UnTiro v1 p1 a1) = UnTiro 100 (snd h / 2) 5


hierro :: Participantes -> Tiro -> Tiro
hierro (UnParticipante _ _ h) (UnTiro v2 p2 n)  |between 1 10 n = UnTiro (fst h * n) (snd h / n) (n * n)
                                                |otherwise = paloQueNoExiste

{-golpe (UnParticipante _ _ h) palos = -}


puedeSuperar obs (UnTiro v p a) = filter  ==obs 
