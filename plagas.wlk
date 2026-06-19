class Plaga{
    var property cantidadDeBichos 
    method poblacion() = cantidadDeBichos
    method nivelDeDaño()
    method transmitirEnfermedad() = self.poblacion() >= 10
    method realizarAtaque() { cantidadDeBichos += self.poblacion() * 0.1 } 
    method ataque(unElemento) { 
        self.realizarAtaque()
        unElemento.recibirAtaque(self) 
    }    
}

class Cucarachas inherits Plaga{
    var property pesoPromedio = 0
    override method nivelDeDaño() = self.poblacion() / 2
    override method transmitirEnfermedad() = super() && self.pesoPromedio() >= 10
    override method realizarAtaque() {
        super()
        pesoPromedio + 2 
    }
}

class Pulgas inherits Plaga{
    override method nivelDeDaño() = self.poblacion() * 2 
}

class Garrapatas inherits Pulgas{
    override method realizarAtaque() { cantidadDeBichos += self.poblacion() * 0.2 }
}

class Mosquitos inherits Plaga{
    override method nivelDeDaño() = self.poblacion()
    override method transmitirEnfermedad() = super() && self.poblacion() % 3 == 0
}

