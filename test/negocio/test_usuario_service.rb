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
end