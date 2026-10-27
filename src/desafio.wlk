import src.barraDeProgreso.*
import src.eventos.*
import src.jugador.*

object verificadorDeDesafio{ //se encargaría de conocer qué flecha debe presionar el jugador y determinar si una entrada es correcta.
    const direcciones = ["arriba", "abajo", "izquierda", "derecha"]
    var direccionCorrecta = "arriba"

    method esCorrecta(direccionPresionada) = direccionPresionada == direccionCorrecta

    method cambiarDireccion(nuevaDireccion) {
        direccionCorrecta = nuevaDireccion
    }

    method generarDireccion() {
        self.cambiarDireccion(direcciones.anyOne())

    }


}