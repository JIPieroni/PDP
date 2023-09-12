object sanMartin {
	var cantidadDeCaballos  = 2
	var ejercito = [] 
	var tropas = #{}

	
	
	
	method reclutarSoldado(soldado){
		ejercito.add(soldado)
	}
	
	method expulsarSoldado(soldado){
		ejercito.remove(soldado)
	}
	
	
	method estaEnElEjercito(soldado){	
		return  ejercito.contains(soldado)
	}
	
	method caballoParaLasTropas(){
		return ejercito.size() <= cantidadDeCaballos
		}
		
		
	method disolverEjercito(){
		ejercito.clear()
	}
		
}





object cabral {
	var cantidadDeCaballos
	
}


object luisBeltran {
	
	
	
	
	
	

}



object remediosDeEscalada {
	
		
}



