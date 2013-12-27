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
    assert last_response.body.include?('muevete')
  end

  def test_se_muestra_las_peticiones_con_su_imagen_titulo_firmasConseguidas_enlace
    get '/index'
    assert last_response.ok?
    assert last_response.body.include?('1.jpg')
    assert last_response.body.include?('Que se proteja al berberecho salvaje')
    assert last_response.body.include?('Firmas conseguidas')
    assert last_response.body.include?('peticion?id=1')
  end

  def test_aparecen_botones_de_login_y_registro
    get '/index'
    assert last_response.ok?
    assert last_response.body.include?('Login')
    assert last_response.body.include?('Register')
  end

  def test_comprobar_campos_del_login
    get '/index'
    assert last_response.ok?
    assert last_response.body.include?('Usuario')
    assert last_response.body.include?('Contraseña')
    assert last_response.body.include?('Entrar')
  end

  def test_comprobar_campos_del_registro
    get '/index'
    assert last_response.ok?
    assert last_response.body.include?('Email')
    assert last_response.body.include?('Password')
    assert last_response.body.include?('Confirmar Password')
    assert last_response.body.include?('Registrar')
  end

  def test_acceder_a_la_vista_de_peticiones
    get '/peticion', :id => '1'
    assert last_response.ok?
  end

end