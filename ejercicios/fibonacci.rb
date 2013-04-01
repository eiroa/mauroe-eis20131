require "test/unit"

class Fibonacci < Test::Unit::TestCase

  def es_de_fibonacci(numero)
    sucesion = 3
    miSucesionFibonacci = [0,1]
    while miSucesionFibonacci.last < numero 
      miSucesionFibonacci.push(sucesionFibonacci(sucesion))
      sucesion = sucesion +1
    end
    return miSucesionFibonacci.include?(numero)
  end 

#Implementacion de la sucesion de fibonacci con recursividad
  def sucesionFibonacci(numero)
    if numero == 0
      return 0
    else 
      if numero == 1
        return 1
      else
        return sucesionFibonacci(numero-1) + sucesionFibonacci(numero-2)
      end
    end
  end
  
  
  def test_es_de_fibonacci
    assert_equal(89,sucesionFibonacci(11))
    assert(es_de_fibonacci(89))
    assert(!es_de_fibonacci(100))
    assert(es_de_fibonacci(0))
    assert(es_de_fibonacci(1))
    assert(es_de_fibonacci(55))
    assert(!es_de_fibonacci(1000))
  end
end

