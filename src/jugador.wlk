import src.juego.*
import src.barraDeProgreso.*
import src.estados.*
import src.eventos.*

object jugador {
    var estado = normal
    var racha = 0

    //PREGUNTAR, DEVOLVEMOS UN RESULTADO Y TAMBIEN MODIFICAMOS, ESTA BIEN??
    method acertar() {

        self.aumentarRacha() //Aumenta la racha
        self.cambiarEstado( //Cambia de estado
            estado.estadoLuegoDeAcierto(racha) //Evalua en base a la racha que estado tiene que estar
        ) 
        
    }

    method puntosPorAcierto() = estado.sumaPorAcierto()

    method errar() {
        self.reestablecerRacha()
        self.cambiarEstado(
            estado.estadoLuegoDeFallo() 
        )
    }
    method puntosPorFallo() = estado.restaPorFallo()

    method aumentarRacha() {
        racha += 1
    }

    method reestablecerRacha() {
        racha = 0
    }

    method cambiarEstado(unEstado) {
        if (estado != unEstado) {
            estado = unEstado
            self.reestablecerRacha()
        }
    }

    //Los implemente para los tests
    method estadoActual() = estado
    method rachaActual() = racha

/*
    method puedeCambiarDeEstado() = estado.cambiaDeEstadoDespuesDe() == racha 
    

    method pasarAlSiguienteEstado() { //Ya sabemos que esto va a volar
      if(estado == normal){
        if(racha == 0){
            self.cambiarEstado(bajoneado)
        }
        else if(racha == 5) {
            self.cambiarEstado(cebado)
        }
      }
      else if(estado == cebado && racha == 0){
            self.cambiarEstado(normal)
      }
      else if(estado == bajoneado && racha == 3){
            self.cambiarEstado(normal)
      }
    }
}

Vamos a usar el patrón State:
Queríamos que cada estado se encargara de determinar cuándo corresponde cambiar a otro.
Pero en este código sucede lo contrario.
Jugador está preguntando:
¿Estoy en Normal?
¿Estoy en Cebado?
¿Estoy en Bajoneado?
Y después decide qué hacer.
Esto es justamente lo que queríamos evitar mediante el polimorfismo.
¿Por qué es un problema?
Imaginemos que mañana agregamos un cuarto estado llamado Motivado.
Tendríamos que volver a modificar Jugador y agregar otro if.
En cambio, si delegamos las transiciones a los estados, Jugador no necesita conocer las reglas particulares de cada uno.
Mi recomendación es trasladar esa responsabilidad a los estados.
Eso sí: utilizar if dentro de un estado para evaluar una condición como racha >= 5 es perfectamente válido.

*/



}