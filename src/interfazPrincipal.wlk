import src.barraDeProgreso.*
import src.eventos.*
import src.jugador.*

object juego {
  const barraProgreso= barraDeProgreso
  const player = jugador

  method procesarAcierto(){
    const puntos = player.acertar()
    barraProgreso.aumentarProgreso(puntos)
  }

  method procesarFallo() {
    const puntos = player.errar()
    barraProgreso.disminuirProgreso(puntos)
  }


}