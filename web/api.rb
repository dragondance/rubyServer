require 'sinatra/base' #Fijáos en que el 'require' cambia
require 'sinatra/mustache'
require 'sinatra/reloader'
require 'json'
require_relative '../datos/init_datamapper'
require_relative '../negocio/usuario_service'
require_relative '../negocio/peticion_service'


class ServidorAPI < Sinatra::Base
  register Sinatra::Reloader

  get '/usuarios/:login' do
    usuario = UsuarioService.new.mostrar_usuario(params[:login]).to_json
  end

  post '/usuarios' do
    json_data = JSON.parse request.body.read
    if json_data['nombre'] == '' || json_data['apellidos'] == '' || json_data['login'] == '' || json_data['password'] == ''
      status 400
    else
      usuario = UsuarioService.new.registrar(json_data['nombre'], json_data['apellidos'], json_data['login'], json_data['password'])
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

  post '/peticiones' do
    json_data = JSON.parse request.body.read
    if(json_data['titulo'] == '' || json_data['fin'] == '' || json_data['texto'] == '' || json_data['firmasObjetivo'] == '')
      status 400
    else
      if(session[:login])
        peticion = PeticionService.new.crear_peticion(json_data['titulo'], json_data['fin'], json_data['texto'], json_data['firmasObjetivo'])
        if(peticion)
          status 201
        else
          400
        end
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