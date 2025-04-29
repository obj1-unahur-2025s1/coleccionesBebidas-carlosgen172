object tito {
    var cantidad = 0
    var bebida = cianuro
    method peso() = 70
    method inerciaBase() = 490
    method consumir(unaCantidad,unaBebida) {
        bebida = unaBebida
        cantidad = unaCantidad
    }
    method bebida() = bebida

    method velocidad() {
        return bebida.rendimiento(cantidad)
                * self.inerciaBase() / self.peso()
    }
}

object whisky {
    method rendimiento(cantidad) = 0.9 ** cantidad
}
object cianuro {
    method rendimiento(cantidad) = 0
}

object terere {
    method rendimiento(cantidad) {
        return 1.max(cantidad * 0.1)
        //tambien (cantidad * 0.1).max(1)
    }
}

object licuadoDeFrutas {
    var property ingredientes = [3, 6, 1, 10]
    method rendimiento(cantidad) {
        return ingredientes.sum()
    }
    method agregarMasFrutas(listaDeFrutas) {
        ingredientes.addAll(listaDeFrutas)
        return ingredientes
    }
}

object aguaSaborizada {
    var property bebida = whisky
    method rendimiento(cantidad) {
        return 1 + (bebida.rendimiento(cantidad)/4)
    }
}

object coctel {
    var property bebidas =[whisky, terere]
    var rendimiento = 1
    method rendimiento(cantidad) {
        bebidas.forEach({b => rendimiento =
            rendimiento * b.rendimiento(cantidad)})
            return rendimiento
    }
}

object coctelSuave {
    var property bebidas =[coctel, licuadoDeFrutas]
    method rendimiento(cantidad) {
        const rendimiento = bebidas.filter({b => b.rendimiento(cantidad) > 0.5})
        return rendimiento.sum({b => b.rendimiento(cantidad)})
    }
}

