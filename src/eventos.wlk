import wollok.game.*
import src.juego.*
import src.barraDeProgreso.*
import src.jugador.*
import src.desafio.*

object flechaEnPantalla {

    method position() = game.at(4, 1)

    method image() {
        if (juego.estaTerminado())
            return "flechas/victoria.png"

        return "flechas/" +
            verificadorDeDesafio.direccionActual() +
            ".png"
    }
}


object cartelVictoria {

    method position() = game.at(3, 3)

    method text() = if (juego.estaTerminado()) "¡META ALCANZADA!" else ""

    method textColor() = "00FF00FF"
}

object cartelReinicio {

    method position() = game.at(2, 2)

    method text() = if (juego.estaTerminado()) "Presiona ESPACIO para reiniciar" else ""

    method textColor() = "FFFFFFFF"
}
