import src.juego.*
import src.elementosVisuales.*
import src.jugador.*
import src.estados.*

object barraDeProgreso {
    const meta = 100
    var progresoActual = 0

//Getters
    method progresoActual() = progresoActual
    method meta() = meta 

//Funciones
    method aumentarProgreso(unaCantidad) {
        progresoActual = (progresoActual + unaCantidad).min(meta)
    }

    method disminuirProgreso(unaCantidad) {
        progresoActual = (progresoActual - unaCantidad).max(-1)
    }

    method estaCompleta() = progresoActual == meta

    method reiniciar() {
        progresoActual = 0
    }
}
