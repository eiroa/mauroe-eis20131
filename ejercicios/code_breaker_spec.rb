require 'rspec'
require_relative './code_breaker'

describe CodeBreaker do

  describe 'guessMethod - failing' do

    it 'should decrement life when fail and not add letter to guessedLetters' do

      code_breaker = CodeBreaker.new('home')
      initial_life = code_breaker.life
      expected_size = 0
      code_breaker.guess('c')
      code_breaker.life.should eq initial_life-1
      expect(code_breaker.guessedLetters.length()).to eq(expected_size)
      
      

    end

  end
  
  describe ' currentState initiated correctly' do
    it 'should fully replace  the given code with several *' do
      code_breaker = CodeBreaker.new('ingenieria')
      expect(code_breaker.currentState).to eq '**********'
    end
  end
  
  describe 'guess - guessing same letter' do
  
    it 'should guess a letter, add it to guessed letters, but trying to guess same letter twice should do nothing' do

      code_breaker  = CodeBreaker.new('cat')
      expected_size = 1
      code_breaker.guess('c')
      code_breaker.guess('c')
      expect(code_breaker.guessedLetters.length()).to eq(expected_size)

    end
  end
  
  describe 'guess - still alive' do
    it 'should check if still alive after missing a hit' do
      code_breaker  = CodeBreaker.new('potatoe')
      code_breaker.guess('x')
      expect(code_breaker.stillAlive()).to eq true
    end
  end
  
  describe 'guess - lostGame' do
    it 'should check if still NOT alive after missing 5 hits and consequently lossing' do
      code_breaker  = CodeBreaker.new('potatoe')
      code_breaker.guess('x')
      code_breaker.guess('d')
      code_breaker.guess('f')
      code_breaker.guess('g')
      code_breaker.guess('i')
      expect(code_breaker.stillAlive()).to eq false
      expect(code_breaker.gameWon).to eq false
    end
  end
  
  describe 'guess - lostGame and restarting a new Game' do
    it 'should check if after losing game, a new game starts correctly' do
      code_breaker  = CodeBreaker.new('potatoe')
      code_breaker.guess('x')
      code_breaker.guess('d')
      code_breaker.guess('f')
      code_breaker.guess('g')
      code_breaker.guess('i')
      code_breaker.newGame('pomodoro')
      expect(code_breaker.life).to  eq 5
      expect(code_breaker.guessedLetters.empty?).to eq true
      expect(code_breaker.code).to  eq 'pomodoro'
    end
  end
  
  describe 'guess - verifying currentState ' do
  
    it 'should guess the code letter by letter and current State should show that correctly' do

      code_breaker  = CodeBreaker.new('batata')
      expected_size = 3
      code_breaker.guess('t')
      expect(code_breaker.currentState).to eq '**t*t*'
      code_breaker.guess('a')
      expect(code_breaker.currentState).to eq '*atata'
      code_breaker.guess('b')
      expect(code_breaker.currentState).to eq 'batata'
      expect(code_breaker.guessedLetters.size()).to eq 3
      expect(code_breaker.gameWon).to eq true

    end
  end
  
  describe 'guess/ gameWon - testing victory' do
    it 'should guess the code and verify victory with gameWon method' do
      code_breaker = CodeBreaker.new('pepe')
      code_breaker.guess('p')
      code_breaker.guess('e')
      expect(code_breaker.guessedLetters.size()).to eq 2
      expect(code_breaker.gameWon).to eq true
    end
  end
end
