




--import Text.Show.Functions


data Choferes = UnChofer {
    nombreChofer :: String,
    kilometrajeDeSuAuto :: Float,
    viajesQueTomo :: Int 
} deriving (Show, Eq)


data Viaje = UnViaje {
    fecha:: String,
    costo :: Int,
    cliente:: Clientes
} deriving (Show, Eq)

data Clientes = UnCliente {
    nombreCliente :: String,
    domicilio :: String
} deriving (Show, Eq)





tomaCualquierViaje ::  Viaje -> Bool
tomaCualquierViaje _ = True


tomaViajeConCosto ::  Viaje -> Bool
tomaViajeConCosto = (> 200) . costo


--tomaViajeConNombre :: Int -> Clientes -> Bool
tomaViajeConNombre n =  length nombreCliente > n



{-






-}