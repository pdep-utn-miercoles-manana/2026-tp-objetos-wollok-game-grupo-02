import wollok.game.*
import src.juego.*
import src.barraDeProgreso.*
import src.jugador.*
import src.desafio.*
import src.relojDelDesafio.*

object flechaEnPantalla {

    method position() = game.at(4.49, 1)

    method image() {
        if (!juego.estaIniciado() || juego.estaTerminado())
            return "flechas/victoria.png"

        return "flechas/" +
            verificadorDeDesafio.direccionActual() +
            ".png"
    }
}

object barraTiempoVisual {

    method position() = game.at(4.3, 2)

    method image() {
        if (!juego.estaIniciado() || juego.estaTerminado() || !relojDelDesafio.estaEsperando())
            return "tiempo/tiempo_vacio.png"

        const nivel = (relojDelDesafio.porcentajeTiempo() / 10).truncate(0).min(10).max(0)
        return "tiempo/tiempo_" + nivel.toString() + ".png"
    }
}

object fondoMenuVisual {
    method position() = game.origin()

    method image() {
        // Si el juego NO ha iniciado, muestra la imagen del fondo del menú. 
        // Si ya inició, devuelve "" para dejar ver el fondo de la partida.
        if (!juego.estaIniciado()) {
            return "fondo_menu.png" 
        }
        return ""
    }
}

object cartelVictoria {

    method position() = game.at(4, 7.5)

    method text() = if (juego.estaGanado()) "                         ¡META ALCANZADA!" else "" //25 espacios

    method textColor() = "00FF00FF"
}

object cartelDerrota {

    method position() = game.at(4, 7.5)
    
    method text() = if (juego.estaDerrotado()) "                         ¡CASI INTENTA OTRA VEZ!" else ""
    
    method textColor() = "FF0000FF" 
}

object cartelReinicio {

    method position() = game.at(4, 2.4)

    method text() = if (juego.estaTerminado()) "                         Presiona ESPACIO para reiniciar" else "" //25 espacios

    method textColor() = "FFFFFFFF"
}

object cartelMenu {

    method position() = game.at(4, 0)

    method text() = if (!juego.estaIniciado()) "                         Presiona ESPACIO para comenzar" else ""

    method textColor() = "FFD700"
}

object cartelFeedback {
    var mensaje = ""
    var color = "FFFFFFFF"

    method position() = game.at(4, 4)

    method text() = mensaje
    method textColor() = color

    method mostrarMensaje(texto, unColor) {
        mensaje = texto
        color = unColor

        game.schedule(400, {
            if (mensaje == texto) {
                mensaje = ""
            }
        })
    }
}

object cartelTutorial {
    method position() = game.at(7, 1)

    method text() =
        if(!juego.estaIniciado()) {
            "=== TUTORIAL ===\n" +
            "Presiona las flechas ← ↑ → ↓ antes de que\n" +
            "se te acabe el tiempo para aumentar tu progreso\n" + 
            "y lograr sacar la Esapada para convertirte en Rey.\n" + "\n"
        } else {
            ""
        }
    
    method textColor() = "FFFFFFFF"
}
/*
object cartelGuiaDeEstados {
    method position() = game.at(2, 5)
    
    method text() = 
        if (!juego.estaIniciado()) {
            "=== GUÍA DE ESTADOS ===\n" +
            "• Normal: Suma +1 / Resta -1\n" + "\n" +
            "• Cebado: Suma +5 / Resta -3\n" + "\n" +
            "• Bajoneado: Suma 0 / Resta -2"
        } else {
            ""
        }
        
    method textColor() = "FFFFFFFF"
}
*/


// --- ESTADO NORMAL ---

object menuTextoNormal {
    method position() = game.at(3, 1)
    method text() = if (!juego.estaIniciado()) "Normal: Suma +1 / Resta -1" else ""
    method textColor() = "FFFFFFFF"
}

// --- ESTADO CEBADO ---

object menuTextoCebado {
    method position() = game.at(3, 4)
    method text() = if (!juego.estaIniciado()) "Cebado: Suma +5 / Resta -3" else ""
    method textColor() = "B2FFFF"
}

// --- ESTADO BAJONEADO ---
object menuTextoBajoneado {
    method position() = game.at(3, 7)
    method text() = if (!juego.estaIniciado()) "Bajoneado: Suma 0 / Resta -2" else ""
    method textColor() = "bdbdbd"
}