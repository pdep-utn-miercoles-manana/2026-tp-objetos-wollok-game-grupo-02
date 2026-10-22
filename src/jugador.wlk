import src.interfazPrincipal.*
import src.barraDeProgreso.*
import src.estados.*
import src.eventos.*

object jugador {
    var estado = normal
    var racha = 1 

    method acertar() {
        estado.procesarAcierto()
    }

    method errar() {
        estado.procesarFallo()
    }

    method aumentarRacha() {
        racha += 1
    }

    method reestablecerRacha() {
        racha = 0
    }

    method cambiarEstado(unEstado) {
        estado = unEstado       
    }

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