import wollok.game.*
import src.barraDeProgreso.*
import src.jugador.*
import src.estados.*

// Mismo marco 221x34 y mismo progreso en todos los estados.
object barraVisual {
    method position() = game.at(3, 9)

    method image() {
    const porcentaje = barraDeProgreso.progresoActual().truncate(0)
    var prefijo = "barra/barra_"

    //if (jugador.estadoActual() == cebado) 
    if (jugador.estaEnEstado(cebado)) {
        prefijo = "barra/barra_cebado_"
    }

    //if (jugador.estadoActual() == bajoneado) 
    if (jugador.estaEnEstado(bajoneado)) {
        prefijo = "barra/barra_bajoneado_"
    }

    return prefijo + porcentaje.toString() + ".png"
}
}