require "test/unit"

class Palindromo < Test::Unit::TestCase

  def es_palindromo(palabra)
    miPalabra = palabra.gsub(/\s+/, "")  # Elimino espacios en blanco en caso de recibir un palindromo de mas de 1 palabra
    return miPalabra.eql? (miPalabra.reverse) 
  end
  
  def test_es_palindromo
    assert(es_palindromo("salas"))
    assert(!es_palindromo("dinosaurio"))
    assert(es_palindromo("nada yo soy adan"))
    assert(!es_palindromo("hola pepito sanchez"))
  end
end



