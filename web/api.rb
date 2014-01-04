require 'sinatra/base' #Fijáos en que el 'require' cambia
require 'sinatra/mustache'
require 'sinatra/reloader'
require_relative '../datos/init_datamapper'
require_relative '../negocio/usuario_service'
require_relative '../negocio/peticion_service'


class ServidorAPI < Sinatra::Base
  register Sinatra::Reloader

  get '/usuarios/:login' do
    usuario = UsuarioService.new.mostrar_usuario(params[:login]).to_json
  end

  post '/usuarios' do
    if params[:login] == '' || params[:password]  == '' || params[:nombre] == '' || params[:apellidos] == ''
      status 400
    else
      usuario = UsuarioService.new.registrar(params[:nombre], params[:apellidos], params[:login], params[:password])
      if usuario
        status 201
      else
        status 400
      end
    end
  end

  get '/loginDisponible/:login' do
    status 200
    disponible = UsuarioService.new.loginDisponible(params[:login])
    if disponible
      'OK'
    else
      'no'
    end
  end

  configure do
    'Arrancando la aplicacion ...'
    init_datamapper
    Tilt.register Tilt::MustacheTemplate, 'html'

    @servicioPeticiones = PeticionService.new
  end
end