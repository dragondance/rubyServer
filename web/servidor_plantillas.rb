require 'sinatra/base' #Fijáos en que el 'require' cambia
require 'sinatra/mustache'
require 'sinatra/reloader'
require_relative '../datos/init_datamapper'
require_relative '../negocio/peticion_service'
require_relative '../negocio/usuario_service'


class ServidorPlantillas < Sinatra::Base
  register Sinatra::Reloader

  get '/' do
    'Hola Sinatra'
  end

  get '/index' do
    @destacadas = PeticionService.new.listar_destacadas
    mustache :index
  end

  get '/peticion' do
    @peticion = PeticionService.new.mostrar_peticion(params[:id])
    mustache :peticion
  end

  get '/usuario' do
    @usuario = UsuarioService.new.mostrar_usuario(params[:login])
    mustache :usuario
  end

  configure do
    'Arrancando la aplicacion ...'
    init_datamapper
    Tilt.register Tilt::MustacheTemplate, 'html'

    @servicioPeticiones = PeticionService.new
  end
end