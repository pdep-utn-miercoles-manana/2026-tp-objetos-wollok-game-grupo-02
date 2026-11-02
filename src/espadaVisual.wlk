import wollok.game.*
import src.barraDeProgreso.*
import src.jugador.*
import src.estados.*

// La espada no termina de salir de la piedra hasta llegar a la meta.
// Este objeto es exclusivamente visual: no altera el progreso ni los estados.
object espadaVisual {
    method position() = game.at(3, 3)
    method image() {
    const tramo = (barraDeProgreso.progresoActual() / 10).truncate(0)

    var prefijo = "espada/espada_"

    //if (jugador.estadoActual() == cebado) 
    if (jugador.estaEnEstado(cebado)) {
        prefijo = "espada/espada_cebado_"
    }

    //if (jugador.estadoActual() == bajoneado) 
    if (jugador.estaEnEstado(bajoneado)) {
        prefijo = "espada/espada_bajoneado_"
    }

    return prefijo + tramo.toString() + ".png"
}
}
