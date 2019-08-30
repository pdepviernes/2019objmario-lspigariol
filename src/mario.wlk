import wollok.game.*

object juego {

	method iniciar() {
		game.title("Mario el ahorrista")
		game.width(7)
		game.height(7)
		game.addVisual(peso)
		game.addVisual(unDolar)
		game.addVisual(flor)
		game.addVisual(balanza)
		game.addVisual(mario)
		game.start()
	}

}

object plazoFijo{
	var dias = 10
	method rendimiento(alguien){
			return alguien.ahorros()*0.02*dias
		}
}
object lebac{
	method rendimiento(alguien){
		return (alguien.ahorros()+banco.pesos())/2*0.10
	}
}
object bono{
	
	method rendimiento(alguien){
		return alguien.ahorros()*banco.inflacion()
  	}
}


object mario {
    var inversion = plazoFijo
	var position = game.center()
	var pesosAhorrados = 0
	method buenAhorrista(){
		mario.valorFinanciero() > 1000
	}
	method valorFinanciero() {
		return pesosAhorrados+inversion.rendimiento(self)
	}
	method levantar(cosa) {
		pesosAhorrados = pesosAhorrados + cosa.valor()
		position = cosa.position()
		game.say(self, "Junte " + cosa.valor())
		
	}
	method inversion(nueva){
		inversion = nueva
	}

	method mostrarAhorros() {
		game.say(self, "Junte " + pesosAhorrados + " pesos.")
	}
	
	method ahorros() = pesosAhorrados
	
	method image() { return "mario.png"}
	method position() { return position}

}

object peso {

	const valor = 5

	method valor() {return valor}

	method position() {return game.center().right(2)}
	method image() {return "peso.png"}

}

object unDolar {

	method valor() {return banco.cotizacion()}

	method position() {return game.center().left(2)}
	method image() {return "dolar.png"}

}

object banco {
	var property inflacion = 0.4
	var cotizacion = 45
	
	method cotizacion() {return cotizacion}

	method corrida(){
		cotizacion = 57
		balanza.desbalancear()
	}

	method tranquilidad(){
		cotizacion = 45
		balanza.balancear()
	}
	method pesos() {
		return 100*self.cotizacion()
	}
//	method inflacion() = inflacion 
//	method inflacion(nueva){
//		inflacion = nueva
//	} 
}

object flor {

	method valor() {return 0}

	method position() {return game.center().up(2)}
	method image() {return "flor.png"}

}

object tomate{
	
	method image() = "tomate.png"
	method position() = game.center().left(2).up(2)
	
	method valor() = 20
}

object balanza {
	const imagenBalanceada ="balanceado.png" 
	var imagen = imagenBalanceada 
	
	method balancear() { 
		imagen = imagenBalanceada 
	}
	
	method desbalancear() { 
		imagen = "desbalanceado.png"
	}
	
	method position() {return game.center().down(2)}
	method image() {return imagen}
}

object luigi{
	var inversion = lebac
	
	method ahorros() = 10
	method inversion(nueva){
		inversion = nueva
	}
	method valorFinanciero(){
		return inversion.rendimiento(self)/2
	}
	
	
	method image() = "estrella.png"
	method position() = game.at(1,1)	
}
