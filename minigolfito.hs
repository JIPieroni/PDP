


data Participantes = UnParticipante
  { nombre :: String,
    nombrePadre :: String,
    habilidades :: Habilidad
  }
  deriving (Show, Eq)

data Habilidad = UnaHabilidad
  { fuerza :: Float,
    precision :: Float
  }
  deriving (Show, Eq)

bart, todd, rafa :: Participantes
bart = UnParticipante "Bart" "Homero" (UnaHabilidad 25 60)
todd = UnParticipante "Todd" "Ned" (UnaHabilidad 15 80)
rafa = UnParticipante "Rafa" "Gorgory" (UnaHabilidad 10 1)

data Tiro = UnTiro
  { velocidad :: Float,
    prec :: Float,
    altura :: Float
  }
  deriving (Show, Eq)

newtype Obstaculo = UnObstaculo {obstaculo :: (Tiro -> Bool, Tiro -> Tiro)}

between n m x = elem x [n .. m]

laguna :: Float -> Obstaculo
laguna x = UnObstaculo ((\(UnTiro v p a) -> v > 80 && (between 10 50 a)), (\(UnTiro v p a) -> (UnTiro (v / x) (p / x) (a / x))))

tunelConRampita :: Obstaculo
tunelConRampita = UnObstaculo ((\(UnTiro v p a) -> p > 90 && a == 0), (\(UnTiro v p a) -> (UnTiro (v * 2) 100 0)))

hoyo :: Obstaculo
hoyo = UnObstaculo ((\(UnTiro v p a) -> between 5 20 v && p > 95 && a == 0), (\(UnTiro _ _ _) -> UnTiro 0 0 0))

maximoSegun f = foldl1 (mayorSegun f)

mayorSegun f a b
  | f a >= f b = a
  | otherwise = b

--palos = [putter, madera, hierro]

putter (UnaHabilidad f p) = UnTiro 10 (2 * p) 0

madera (UnaHabilidad f p) = UnTiro 100 (p / 2) 5

hierro (UnaHabilidad f p) n = UnTiro (f * n) (p / n) (n - 3)
