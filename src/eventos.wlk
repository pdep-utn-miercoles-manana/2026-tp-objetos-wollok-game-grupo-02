import wollok.game.*
import src.juego.*
import src.barraDeProgreso.*
import src.jugador.*
import src.desafio.*

object flechaEnPantalla {

    method position() = game.at(4, 1)

    method image() {
        if (!juego.estaIniciado() || juego.estaTerminado())
            return "flechas/victoria.png"

        return "flechas/" +
            verificadorDeDesafio.direccionActual() +
            ".png"
    }
}


object cartelVictoria {

    method position() = game.at(4.49, 7.5)

    method text() = if (juego.estaGanado()) "                         ¡META ALCANZADA!" else "" //25 espacios

    method textColor() = "00FF00FF"
}

object cartelDerrota {
    method position() = game.at(4.49, 7.5)
    method text() = if (juego.estaDerrotado()) "                         ¡CASI INTENTA OTRA VEZ!" else ""
    method textColor() = "FF0000FF" // Rojo para derrota
}

object cartelReinicio {

    method position() = game.at(4.49, 2.4)

    method text() = if (juego.estaTerminado()) "                         Presiona ESPACIO para reiniciar" else "" //25 espacios

    method textColor() = "FFFFFFFF"
}

object cartelMenu {

    method position() = game.at(4.49, 2.4)

    method text() = if (!juego.estaIniciado()) "                         Presiona ESPACIO para comenzar" else ""

    method textColor() = "FFFFFFFF"
}