class CodeBreaker
  attr_reader :code, :life, :guessedLetters
  def initialize(code)
    @code = code
    @life = 5
    @guessedLetters = []
  end


  def newGame(code)
    initialize(code)
  end

  def guess(letter)
    if stillAlive && !(gameWon)
      if !(@guessedLetters.include?(letter))
        if(@code.include?(letter))
          @guessedLetters.push(letter)
        else
          @life = (@life - 1 )
        end
      end
    end
  end

#Diferencia entre arrays,esto da un array vacio cuando se encuentran los mismos elementos aunque repetidos. 
  def gameWon
    ( @code.split(//) - @guessedLetters ).empty?
  end
  
  def stillAlive
    @life > 1
  end
end

