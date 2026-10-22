import src.jugador.*
import src.interfazPrincipal.*
import src.barraDeProgreso.*
import src.eventos.*

class Estado{
    const sumaPorAcierto
    const restaPorFallo 
    const cambiaDeEstadoDespuesDe

    method cambiaDeEstadoDespuesDe() = cambiaDeEstadoDespuesDe 

    method procesarAcierto() {
        barraDeProgreso.aumentarProgreso(sumaPorAcierto)
    }

    method procesarFallo() {
        barraDeProgreso.disminuirProgreso(restaPorFallo)
    }
}

const normal = new Estado(sumaPorAcierto = 1, restaPorFallo = 1, cambiaDeEstadoDespuesDe = 5)
const cebado = new Estado(sumaPorAcierto = 5, restaPorFallo = 3, cambiaDeEstadoDespuesDe = 0)
const bajoneado = new Estado(sumaPorAcierto = 0, restaPorFallo = 2, cambiaDeEstadoDespuesDe = 3)
 