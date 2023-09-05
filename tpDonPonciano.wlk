object donPonciano {
	const hectareasTotales = 15
	var hectareasAsembrar = 0
	var cuentaCorriente = 5000 
	
	
	method hectareasAsembrarS(){
		return hectareasAsembrar
	}
	
	
	method superficieSinSembrar(){
		return hectareasTotales - hectareasAsembrar
	}
	
	
	method sembrar(cultivo,hectareasSembradas){
		hectareasAsembrar = hectareasSembradas
		cuentaCorriente = cuentaCorriente - cultivo.precioSemilla() * hectareasSembradas
		
		
	}
	
	
	method fumigaSuCampo(){
		cuentaCorriente = cuentaCorriente - productoQuimico.aplicarProductoQ() * hectareasTotales
		return cuentaCorriente
	}
	
	method mejorRendimiento(costo){
		fertilizante.aplicarFtrigo()
		cuentaCorriente = cuentaCorriente - fertilizante.precioFertilizante(costo) * hectareasAsembrar
		return cuentaCorriente
		
	}
	
	
	method reSembrar(cultivoNuevo,hectareasSembradas){
		 self.sembrar(cultivoNuevo,hectareasSembradas)
	}


	method ampliarSuperficie(){
		return hectareasAsembrar + self.superficieSinSembrar()
	}


	method cosecha(cultivo){
		cuentaCorriente =  cuentaCorriente + (cultivo.ventaCultivo() *  (cultivo.rendimiento() * hectareasAsembrar))
		return cuentaCorriente
	}
	
}


object productoQuimico {
	const precio = 10
	
	method aplicarProductoQ(){
		return precio
	}
	
}


object fertilizante {
	
	method aplicarFtrigo(){
		return trigo.rendimiento() + 2  
		}
		
		
	method aplicarFsoja(){
		soja.rendimiento() + 20
		soja.rendimiento() == 40
		soja.rendimiento() - 20
		return  soja.rendimiento()
		
	}
		
	method aplicarFmaiz(){
		return  maiz.rendimiento() 
		}
		
		
	method precioFertilizante(costo){
		return costo
	}
}


	
	



object trigo {
	const precio = 500 
	const rendimientoCultivo = 10 
	const venta = 1000 
	
	method precioSemilla(){
		return precio 
	}
	
	
	method rendimiento(){
		return rendimientoCultivo
		}
	
	method ventaCultivo(){
		return venta 
		}
	
}

object soja {
	const precio =  self.ventaCultivo()  / 2
	const rendimientoCultivo = 20
	var ventaDolar = 498 
	const ventaPeso = 435
	var retencion = 0.35
	
	method precioSemilla(){
		return precio 
	}
	
	method rendimiento(){
		return rendimientoCultivo
		}
		
	method ventaCultivo(){
		ventaDolar = ventaDolar * ventaPeso
		retencion = ventaDolar * retencion
		ventaDolar = ventaDolar - retencion
		return ventaDolar
		}
}

object maiz{
	const precio = 500 
	const rendimientoCultivo = 15 
	const venta = soja.ventaCultivo() / 2
	
	method precioSemilla(){
		return precio 
	}
	
	method rendimiento(){
		return rendimientoCultivo
		}
		
	method ventaCultivo(){
		return venta 
	}
		
			
}

//cultivo agregado

object sorgo{
	const precio = 200 
	const rendimientoCultivo = 5
	const venta = maiz.ventaCultivo() / 2
	
	method precioSemilla(){
		return precio 
	}
	
	method rendimiento(){
		return rendimientoCultivo
		}
		
	method ventaCultivo(){
		return venta 
	}
}

