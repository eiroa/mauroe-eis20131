require 'rubygems'
require 'sinatra'
require_relative './code_breaker'

class MyApplication < Sinatra::Base
  @@codeBreaker
  
  get '/' do
    'hola mundo'
  end

  get '/pirulo' do
    'pirulo'
  end
  
  get '/palabra' do
    palabra = params[:p]
    @@codeBreaker = CodeBreaker.new(palabra)
     
     erb :printer, :locals => { :campo1 => 'La palabra es', :campo2 => palabra }
  end

  get '/suma' do
    a = params[:a].to_i
    b = params[:b].to_i
    @resultado = a+b
    erb :resultado
  end
  
  get '/adivinar' do
   
   @@codeBreaker.guess(params[:l])
     @campo1 = @@codeBreaker.message1
     @campo2 = @@codeBreaker.message2
   erb :printer, :locals => { :campo1 => @campo1, :campo2 => @campo2 }

  end
  
  
  

end

#Uncomment to run it properly
#MyApplication.run!

=begin
Printer.erb it's just this

<!DOCTYPE html>
<html>
    <body>
        <h1> <%= campo1 %></h1>
        <h2> <%= campo2 %></h2>
    </body>
</html>

=end



