import src.juego.*
import src.barraDeProgreso.*
import src.estados.*
import src.eventos.*

object jugador {
    var estado = normal
    var racha = 0

    method acertar() {
        self.aumentarRacha()
        self.cambiarEstado(
            estado.estadoLuegoDeAcierto(racha)
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

    method reiniciar() {
        self.cambiarEstado(normal)
    }

    // El jugador conoce sus puntos a traves de la barra de progreso
    method puntos() = barraDeProgreso.progresoActual()

    // Metodos para tests y visuales
    method estadoActual() = estado
    method rachaActual() = racha
}
