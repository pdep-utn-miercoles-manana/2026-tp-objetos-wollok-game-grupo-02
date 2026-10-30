import wollok.game.*
import src.juego.*
import src.barraDeProgreso.*
import src.jugador.*
import src.desafio.*

object flechaEnPantalla {

    method position() = game.center()

    method text() {
        if (juego.estaTerminado()) return "★"
        return self.simbolo(verificadorDeDesafio.direccionActual())
    }

    method textColor() = if (juego.estaTerminado()) "FFFF00FF" else "FFFFFFFF"

    method simbolo(direccion) {
        if (direccion == "arriba") return "↑"
        else if (direccion == "abajo") return "↓"
        else if (direccion == "izquierda") return "←"
        else return "→"
    }
}

object visualProgreso {

    method position() = game.at(1, game.height() - 1)

    method text() = "Progreso: " + barraDeProgreso.progresoActual().toString() + "%"

    method textColor() = "FFFFFFFF"
}

object visualPuntos {

    method position() = game.at(1, game.height() - 2)

    method text() = "Puntos: " + jugador.puntos().toString() + " / " + barraDeProgreso.meta().toString()

    method textColor() = "FFFFFFFF"
}

object visualRacha {

    method position() = game.at(1, game.height() - 3)

    method text() = "Racha: " + jugador.rachaActual().toString()

    method textColor() = "FFFFFFFF"
}

object visualEstado {

    method position() = game.at(1, game.height() - 4)

    method text() = "Estado: " + jugador.estadoActual().nombre()

    method textColor() = "FFFFFFFF"
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
