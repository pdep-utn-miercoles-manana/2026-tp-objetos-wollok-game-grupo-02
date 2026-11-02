import src.relojDelDesafio.*
import src.barraDeProgreso.*
import src.eventos.*
import src.jugador.*
import src.desafio.*

// Juego se encarga de recibir el input, coordinar aciertos/fallos y controlar el estado de la partida
object juego {
  const barraProgreso = barraDeProgreso
  const player = jugador
  var iniciado = false

  method estaIniciado() = iniciado 

  method comenzarJuego() {
    iniciado = true
    self.reiniciarPartida()
    relojDelDesafio.iniciar()
  }
  method procesarAcierto() {
    const puntos = player.puntosPorAcierto()
    player.acertar()
    barraProgreso.aumentarProgreso(puntos)
  }

  method procesarFallo() {
    const puntos = player.puntosPorFallo()
    player.errar()
    barraProgreso.disminuirProgreso(puntos)
  }

  method procesarDireccion(direccionPresionada) {
    if (not self.estaTerminado()) {
      if (verificadorDeDesafio.esCorrecta(direccionPresionada)) {
        self.procesarAcierto()
      } else {
        self.procesarFallo()
      }
      // Cambia a la siguiente direccion tanto si acierta como si falla:
      verificadorDeDesafio.generarDireccion()
    }
  }

  method estaTerminado() = self.estaGanado() || self.estaDerrotado()

  method estaGanado() = barraProgreso.estaCompleta() 

  method estaDerrotado() = iniciado && barraProgreso.progresoActual() == -1 && not self.estaGanado()
/*
El metodo queda totalmente obsoleto y en general era delegar algo que ya hacia otro metodo
  method iniciarPartida() {
    self.reiniciarPartida()
  }
*/

  method reiniciarPartida() {
    barraProgreso.reiniciar()
    player.reiniciar()
    verificadorDeDesafio.reiniciar()
  }
}
