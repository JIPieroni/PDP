
// 1 
// item a 

object pepita {
	var energia = 100
	var kilometrosRecorridos = 5
	
	method vuela() {
		energia = energia - kilometrosRecorridos
		energia = energia - 10
	}
	
	method coma(){
		 energia = energia + comida.pera()
	}
		
}


object comida {
	var gramosDeUnaComida 
	method pera(){
		gramosDeUnaComida = 50
		return gramosDeUnaComida
	}
}

//item b 



