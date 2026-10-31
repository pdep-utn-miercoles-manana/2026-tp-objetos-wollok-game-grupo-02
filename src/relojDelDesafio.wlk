import wollok.game.*
import src.juego.*
import src.jugador.*
import src.desafio.*
import src.eventos.*

object relojDelDesafio {

    var identificador = 0
    var esperandoRespuesta = false

    method iniciar() {

        if (!juego.estaTerminado()) {

            identificador = identificador + 1
            esperandoRespuesta = true

            if (!game.hasVisual(flechaEnPantalla)) {
                game.addVisual(flechaEnPantalla)
            }

            const turnoActual = identificador

            game.schedule(jugador.tiempoParaResponder(), {
                self.agotarTiempo(turnoActual)
            })
        }
    }

    method presionar(direccion) {

        if (esperandoRespuesta && !juego.estaTerminado()) {

            esperandoRespuesta = false

            juego.procesarDireccion(direccion)

            self.iniciar()
        }
    }

    method agotarTiempo(turno) {

        if (
            esperandoRespuesta &&
            turno == identificador &&
            !juego.estaTerminado()
        ) {

            esperandoRespuesta = false

            game.removeVisual(flechaEnPantalla)

            juego.procesarFallo()

            game.schedule(400, {

                if (
                    turno == identificador &&
                    !juego.estaTerminado()
                ) {
                    verificadorDeDesafio.generarDireccion()
                    self.iniciar()
                }
            })
        }
    }

    method reiniciar() {

        identificador = identificador + 1
        esperandoRespuesta = false

        juego.reiniciarPartida()

        verificadorDeDesafio.generarDireccion()

        self.iniciar()
    }
}