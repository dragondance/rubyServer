require 'sinatra/base' #Fijáos en que el 'require' cambia
require 'sinatra/mustache'
require 'sinatra/reloader'
require_relative '../datos/init_datamapper'
require_relative '../negocio/usuario_service'


class ServidorAPI < Sinatra::Base
  register Sinatra::Reloader

  get '/usuarios/:login' do
    usuario = UsuarioService.new.mostrar_usuario(params[:login]).to_json
  end

  configure do
    'Arrancando la aplicacion ...'
    init_datamapper
    Tilt.register Tilt::MustacheTemplate, 'html'

    @servicioPeticiones = PeticionService.new
  end
end