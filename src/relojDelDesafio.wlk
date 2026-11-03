import wollok.game.*
import src.juego.*
import src.jugador.*
import src.desafio.*
import src.elementosVisuales.*

object relojDelDesafio {

    var identificadorDeTimer = 0           //identifica los relojes por turnos
    var esperandoRespuesta = false
    var tiempoTotal = 1
    var tiempoRestante = 0

    method estaEsperando() = esperandoRespuesta

    // Retorna el porcentaje de tiempo restante (de 0 a 100)
    method porcentajeTiempo() {
        if (!esperandoRespuesta || tiempoTotal <= 0) return 0
        return ((tiempoRestante * 100) / tiempoTotal).truncate(0)
    }

    method iniciar() {
        if (!juego.estaTerminado()) {

            identificadorDeTimer = identificadorDeTimer + 1
            esperandoRespuesta = true

            tiempoTotal = jugador.tiempoParaResponder()
            tiempoRestante = tiempoTotal

            if (!game.hasVisual(flechaEnPantalla)) {
                game.addVisual(flechaEnPantalla)
            }
        }
    }

    // Se ejecuta periodicamente cada 50ms para descontar tiempo y refrescar la barra visual
    method avanzarTiempo() {
        if (esperandoRespuesta && !juego.estaTerminado()) {
            tiempoRestante = (tiempoRestante - 50).max(0)
            if (tiempoRestante == 0) {
                self.agotarTiempo(identificadorDeTimer)
            }
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
            turno == identificadorDeTimer &&
            !juego.estaTerminado()
        ) {
            esperandoRespuesta = false
            game.removeVisual(flechaEnPantalla)
            juego.procesarFallo()
            game.schedule(400, {
                if (
                    turno == identificadorDeTimer &&
                    !juego.estaTerminado()
                ) {
                    verificadorDeDesafio.generarDireccion()
                    self.iniciar()
                }
            })
        }
    }

    method reiniciar() {
        identificadorDeTimer = identificadorDeTimer + 1
        esperandoRespuesta = false
        juego.reiniciarPartida()
        verificadorDeDesafio.generarDireccion()
        self.iniciar()
    }
}
