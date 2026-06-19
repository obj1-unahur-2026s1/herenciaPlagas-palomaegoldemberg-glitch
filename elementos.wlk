 import plagas.*
 
 
 class Elemento{
    method esBueno()  
    method recibirAtaque(unaPlaga)
 }

 class Hogar inherits Elemento{
    var property nivelDeMugre 
    var property confort 
    override method esBueno() = nivelDeMugre <= confort / 2 
    override method recibirAtaque(unaPlaga) { nivelDeMugre += unaPlaga.nivelDeDaño() } //nivel de mugre al ser property puede usarse sin self ni parentesis
 }

 class Huerta inherits Elemento {
   var property capacidadDeProduccion 
   override method esBueno() = capacidadDeProduccion > nivelDeProduccion.nivelMinimo()
   override method recibirAtaque(unaPlaga) {
        capacidadDeProduccion -= unaPlaga.nivelDeDaño() * 0.1
        if (unaPlaga.transmitirEnfermedad()){
            capacidadDeProduccion -= 10
        }
   }
 }

 object nivelDeProduccion {
   var property nivelMinimo = 0 
 }

class Mascota inherits Elemento{
    var property nivelDeSalud
    override method esBueno() = nivelDeSalud > 250 
    override method recibirAtaque(unaPlaga) {
        if (unaPlaga.transmitirEnfermedad()){
            nivelDeSalud -= unaPlaga.nivelDeDaño()
        }
    }
}

class Barrio {
  const elementos = #{}
  method agregarElementos(unElemento) = elementos.add(unElemento) 

  method esCopado() {
    self.elementosQueSonBuenos() > self.elementosQueNoSonBuenos()
  }
  method elementosQueSonBuenos() = elementos.count({elemento => elemento.esBueno()}) 
  method elementosQueNoSonBuenos() = elementos.count({elemento => not elemento.esBueno()}) 
}

