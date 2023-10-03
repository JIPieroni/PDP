//1
class Galos {
	var property fuerza
	var property resistencia
	
	
	
	method poder(){
		return fuerza * resistencia
	}
	
	
	method recibirDanio(cantidad){
		if(self.estaEnCombate()){
		resistencia = resistencia - cantidad
		}
		
	}
	
	
	method fueraDeCombate(){
		return resistencia == 0
	}
	
	method revivir(puntos){
		resistencia = puntos
	}
	
	
	method aumentarFuerza(cantidad){
		fuerza = fuerza + cantidad
	}
	
	method estaEnCombate(){
		return not(self.fueraDeCombate())
	}
	
	method resistenciaMedia(){
		resistencia = resistencia / 2
	}
	
	
}


//2
object dulceDeLeche {
	
	method mejora(personaje){
		if(not(personaje.fueraDeCombate())){
		personaje.aumentarFuerza(10)
		}
		
		else{
			personaje.revivir(2)
		}
	}
	
}
	
class Muerdago {
	var property tam 
	
	
	method mejora(personaje){
		if(tam < 5){
			personaje.aumentarFuerza(tam)
		}
		else{
			personaje.revivir(personaje.resistenciaMedia())
		}
	}

}

	
class AceiteDeRoca{
	var property cantidad
	
	
	method mejora(personaje){
		personaje.aumentarFuerza(cantidad)
	}
	
}

//3
class Tribu {
	const property integrantes = []
	
	
	method reclutarMiembro(galo){
		integrantes.add(galo)
	}
	
	
	method poderT(){
	return	integrantes.filter({x => x.estaEnCombate()}).map({x => x.poder()}).sum()
		
	}
	
	
	method recibirDanioT(cantidad){
		if(integrantes.length()>10){
		return	integrantes.sortedBy({a,b => a.poder() > b.poder()})
		}
		else{
			return integrantes.forEachx{ x => x.recbirDanio(cantidad)}
		}
	}
	
	
	
}


// 4














