require 'sinatra/base' #Fijáos en que el 'require' cambia
require 'sinatra/mustache'
require 'sinatra/reloader'
require_relative '../datos/init_datamapper'
require_relative '../negocio/peticion_service'
require_relative '../negocio/usuario_service'


class ServidorAutentificacion < Sinatra::Base
  register Sinatra::Reloader

  post '/login' do
    if params[:login] == '' || params[:password]  == ''
      status 400
    else
      usuario = UsuarioService.new.autentificar(params[:login], params[:password])
      if usuario
        session[:login] = usuario.login
        status 200
      else
        status 403
      end
    end
  end

  configure do
    'Arrancando la aplicacion ...'
    init_datamapper
    Tilt.register Tilt::MustacheTemplate, 'html'

    @servicioPeticiones = PeticionService.new
    @servicioUsuarios = UsuarioService.new
  end
end