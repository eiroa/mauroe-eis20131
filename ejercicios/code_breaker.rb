class CodeBreaker
  attr_reader :code, :life, :guessedLetters, :currentState
  def initialize(code)
    @code = code
    @life = 5
    @guessedLetters = []
    @currentState = code.tr( code,'*')
  end


  def newGame(code)
    initialize(code.downcase)
  end

  def guess(letter)
    if stillAlive && !(gameWon)
      if !(@guessedLetters.include?(letter.downcase))
        if(@code.include?(letter.downcase))
          @guessedLetters.push(letter.downcase)
          @currentState = @code.tr( ('^' + @guessedLetters.join ), '*')
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

