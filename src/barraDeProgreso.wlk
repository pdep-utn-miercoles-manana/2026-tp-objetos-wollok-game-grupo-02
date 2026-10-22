import src.interfazPrincipal.*
import src.eventos.*
import src.jugador.*
import src.estados.*

object barraDeProgreso {
    const meta = 10000
    var progreso = 1

//Getters
    method progreso() = progreso
    method meta() = meta 

//Funciones
    method aumentarProgreso(unaCantidad) {
        progreso = (progreso + unaCantidad).min(meta)
    }

    method disminuirProgreso(unaCantidad) {
        progreso = (progreso - unaCantidad).max(0)
    }

    method estaCompleta() = progreso == meta
}