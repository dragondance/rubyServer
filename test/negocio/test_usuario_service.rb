require 'test/unit'
require_relative '../../negocio/usuario_service'
require_relative '../../datos/init_datamapper'

class TestUsuarioService < Test::Unit::TestCase

  init_datamapper

  def test_mostrar_usuario
    usuario = UsuarioService.new.mostrar_usuario('adi@ua.es')
    assert_equal usuario.login, 'adi@ua.es'
  end

  def test_autentificar
    usuario = UsuarioService.new.autentificar('adi@ua.es', 'adi')
    assert_equal usuario.login, 'adi@ua.es'
  end

  def test_resgistrar_usuario
    usuario = UsuarioService.new.registrar('javier', 'piris', 'jpa@ua.es', 'jpa')
    assert_equal usuario.login, 'jpa@ua.es'
  end

  def test_disponibilidad_login
    disponibilidad = UsuarioService.new.loginDisponible('jpa33@ua.es')
    assert_equal disponibilidad, true
  end

  def test_login_no_disponible
    disponibilidad = UsuarioService.new.loginDisponible('adi@ua.es')
    assert_equal disponibilidad, false
  end
end