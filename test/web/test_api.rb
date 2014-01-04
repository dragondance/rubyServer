#encoding: UTF-8
ENV['RACK_ENV'] = 'test'
require 'test/unit'
require 'rack/test'
require_relative '../../web/api'

init_datamapper

class TestApi < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    ServidorAPI
  end

  def body_includes *args
    args.each do |arg|
      assert last_response.body.include?(arg), arg
    end
  end

  def test_obtenemos_al_usuario_logueado
    get 'usuarios/', :login => 'adi@ua.es'
    assert_equal last_response.status, 200
  end

  def test_registrar_nuevo_usuario
    post 'usuarios', :login => 'jpa@ua.es', :password => 'jpa', :nombre => 'javier', :apellidos => 'piris'
    assert_equal last_response.status, 200
  end
end