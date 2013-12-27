# encoding: UTF-8
ENV['RACK_ENV'] = 'test'
require 'test/unit'
require 'rack/test'
require_relative '../../web/servidor_plantillas'

init_datamapper

class TestServidorPlantilla < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    ServidorPlantillas
  end

  def body_includes *args
    args.each do |arg|
      assert last_response.body.include?(arg), arg
end
  end

  def test_default
    get '/'
    assert_equal 'Hola Sinatra', last_response.body
  end

  def test_aparece_el_logo_de_la_pagina_de_inicio
    get '/index'
    assert last_response.ok?
    body_includes 'muevete'
  end

  def test_se_muestra_las_peticiones_con_su_imagen_titulo_firmasConseguidas_enlace
    get '/index'
    assert last_response.ok?
    body_includes '1.jpg', 'Que se proteja al berberecho salvaje', 'Firmas conseguidas', 'peticion?id=1'
  end

  def test_aparecen_botones_de_login_y_registro
    get '/index'
    assert last_response.ok?
    body_includes 'Login', 'Register'
  end

  def test_comprobar_campos_del_login
    get '/index'
    assert last_response.ok?
    body_includes 'Usuario', 'Contraseña', 'Entrar'
  end

  def test_comprobar_campos_del_registro
    get '/index'
    assert last_response.ok?
    body_includes 'Email', 'Password', 'Confirmar Password', 'Registrar'
  end

  def test_acceder_a_la_vista_de_peticiones
    get '/peticion', :id => '1'
    assert last_response.ok?
  end

  def test_aparecen_el_titulo_de_la_peticion
    get '/peticion', :id => '1'
    body_includes 'Que se proteja al berberecho salvaje'
  end

  def test_aparece_la_imagen_que_representa_la_peticion
    get '/peticion', :id => '1'
    body_includes '1.jpg'
  end

  def test_nombre_apellidos_foto_del_creador_de_la_peticion
    get '/peticion', :id => '1'
    body_includes 'adi@ua.es.jpg', 'Alfonso', 'David Iradier', 'usuario?login=adi@ua.es'
  end

  def test_texto_de_la_peticion_en_parrafos
    get 'peticion', :id => '1'
    body_includes 'Desde tiempos inmemoriales los humanos han cazado a los berberechos sin piedad'
  end

  def test_comprobar_campos_para_la_firma_de_peticiones
    get 'peticion', :id => '1'
    body_includes 'Nombre', 'Apellidos', 'Email', 'Motivo', 'Mostar públicamente mi firma ', 'firmar'
  end

  def test_ver_firmas_conseguidas_y_necesarias
    get 'peticion', :id => '1'
    body_includes 'Firmas conseguidas', 'Firmas necesarias'
  end

  def test_acceder_vista_usuario
    get 'usuario', :login =>  'adi@ua.es'
    assert last_response.ok?
  end

  def test_mostrar_los_datos_del_usuario_en_su_vista
    get 'usuario', :login => 'adi@ua.es'
    body_includes 'adi@ua.es.jpg', 'Alfonso', 'David Iradier'
  end
end