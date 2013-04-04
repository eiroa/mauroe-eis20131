require "test/unit"

class Fibonacci < Test::Unit::TestCase

# Primera forma tentativa, calculo la serie completa de fibonacci hasta que el ultimo valor supere o sea igual al numero dado.
# Ineficiente , a partir de numeros en el orden de los millones es inmanejable
  def es_de_fibonacci2(numero)
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
  


#Dado un numero, este será un cuadrado perfecto si su raiz cuadrada, restada con dicho mismo valor tomando el valor entero, da cero.
# ej  9 ->    3 - 3,0 = 0       30 ->     5,47 - 5  != 0
  def esCuadradoPerfecto(numero)
    raiz = Math.sqrt(numero)
    return ((raiz - raiz.floor) == 0)
  end
  
 # Premisa matemática: Un numero entero n, pertenece a la serie de fibonacci si y solo si
 # 5.n^2  + 4  o bien  n^2 - 4  son cuadrados perfectos
  def es_de_fibonacci(numero)
    return  (esCuadradoPerfecto ( (5 * (numero*numero))+4) ) || (esCuadradoPerfecto ( 5 * (numero*numero)-4) )
  end


  def test_es_de_fibonacci
    assert_equal(89,sucesionFibonacci(11))
    assert(es_de_fibonacci(89))
    assert(!es_de_fibonacci(100))
    assert(es_de_fibonacci(0))
    assert(es_de_fibonacci(1))
    assert(es_de_fibonacci(55))
    assert(!es_de_fibonacci(999999999999999))
  end
end

