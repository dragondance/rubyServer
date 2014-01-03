require 'test/unit'
require_relative '../../datos/UsuarioDAO'
require_relative '../../datos/init_datamapper'

init_datamapper

class TestUsuarioDAO < Test::Unit::TestCase
  def test_mostrar_usuario
    usuario = UsuarioDAO.new.mostrar_usuario('adi@ua.es')
    assert usuario.login, 'adi@ua.es'
  end

  def test_autentificar_usuario
    usuario = UsuarioDAO.new.autentificar('adi@ua.es', 'adi')
    assert usuario.login, 'adi@ua.es'
  end
end