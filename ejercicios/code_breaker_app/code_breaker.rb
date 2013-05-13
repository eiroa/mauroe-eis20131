class CodeBreaker
  attr_reader :code, :life, :guessedLetters, :currentState , :message1 , :message2
  def initialize(code)
    @code = code
    @life = 3
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

          if gameWon
           @message1 = "Juego terminado, ganaste"
              @message2  ="Estado: "+@currentState
            else
              
              @message1 = "acierto"
              @message2  = "Estado: "+@currentState
          end
          
        else
          
          @life = (@life - 1 )
          if !(stillAlive)
            @message1 = "ups!"
            @message2  = "Juego terminado, perdiste"
          else
            
           @message1 = "ups!"
           @message2  = "Estado: "+@currentState
          end  
          
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

