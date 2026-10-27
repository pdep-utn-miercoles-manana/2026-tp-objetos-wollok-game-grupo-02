import src.barraDeProgreso.*
import src.eventos.*
import src.jugador.*
import desafio.*


//Juego se encargaría de recibir el resultado y coordinar el acierto o el error.
object juego {
  const barraProgreso= barraDeProgreso
  const player = jugador

  method procesarAcierto(){
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
    if(verificadorDeDesafio.esCorrecta(direccionPresionada)){
      self.procesarAcierto()
    }
    else{
      self.procesarFallo()
    }

  }


}

