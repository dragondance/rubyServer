# encoding: UTF-8
ENV['RACK_ENV'] = 'test'
require 'test/unit'
require 'rack/test'
require_relative '../../web/autentificacion'

init_datamapper

class TestAutentificacion < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    ServidorAutentificacion
  end

  def body_includes *args
    args.each do |arg|
      assert last_response.body.include?(arg), arg
    end
  end

  def test_peticion_login_con_parametros_no_validos
    post 'login', :login => 'adi@ua.es', :password => ''
    assert_equal last_response.status, 400
  end

  def test_peticion_login_con_credenciales_no_validas
    post 'login', :login => 'aid@ua.es', :password => 'adi'
    assert_equal last_response.status, 403
  end

  def test_login_correctamente
    post 'login', :login => 'adi@ua.es', :password => 'adi'
    assert_equal last_response.status, 200
  end
end