import src.jugador.*
import src.juego.*
import src.barraDeProgreso.*
import src.elementosVisuales.*

class Estado {
    const sumaPorAcierto
    const restaPorFallo 
    const cambiaDeEstadoDespuesDe
    const tiempoParaResponder 

    method cambiaDeEstadoDespuesDe() = cambiaDeEstadoDespuesDe 

    method sumaPorAcierto() = sumaPorAcierto
    method restaPorFallo() = restaPorFallo

    method nombre()

    method tiempoParaResponder() = tiempoParaResponder
}
 
object normal inherits Estado(
    sumaPorAcierto = 1,
    restaPorFallo = 1,
    cambiaDeEstadoDespuesDe = 5,
    tiempoParaResponder = 900
) {
    override method nombre() = "Normal"

    method estadoLuegoDeAcierto(racha) {
        if (racha >= cambiaDeEstadoDespuesDe) {
            return cebado
        } else {
            return self
        }
    }
    
    method estadoLuegoDeFallo() {
        return bajoneado
    }
}

object cebado inherits Estado(
    sumaPorAcierto = 5,
    restaPorFallo = 3,
    cambiaDeEstadoDespuesDe = 0,
    tiempoParaResponder = 650
) {
    override method nombre() = "Cebado"

    method estadoLuegoDeAcierto(racha) {
        return self
    }
    
    method estadoLuegoDeFallo() {
        return normal
    }
}

object bajoneado inherits Estado(
    sumaPorAcierto = 0,
    restaPorFallo = 2,
    cambiaDeEstadoDespuesDe = 3,
    tiempoParaResponder = 900
) {
   override method nombre() = "Bajoneado"

    method estadoLuegoDeAcierto(racha) {
        if (racha >= cambiaDeEstadoDespuesDe) {
            return normal
        } else {
            return self
        }
    }
    
    method estadoLuegoDeFallo() {
        return self
    }
}
