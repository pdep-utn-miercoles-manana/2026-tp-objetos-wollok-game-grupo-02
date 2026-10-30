object verificadorDeDesafio {
    const direcciones = ["arriba", "abajo", "izquierda", "derecha"]
    var direccionCorrecta = direcciones.anyOne()

    method direccionActual() = direccionCorrecta

    method esCorrecta(direccionPresionada) = direccionPresionada == direccionCorrecta

    method cambiarDireccion(nuevaDireccion) {
        direccionCorrecta = nuevaDireccion
    }

    // Elige cualquier direccion aleatoria (para arrancar la partida)
    method reiniciar() {
        self.cambiarDireccion(direcciones.anyOne())
    }

    // Elige una direccion aleatoria diferente a la actual (para cambiar al acertar)
    method generarDireccion() {
        const posibles = direcciones.filter({ d => d != direccionCorrecta })
        self.cambiarDireccion(posibles.anyOne())
    }
}
