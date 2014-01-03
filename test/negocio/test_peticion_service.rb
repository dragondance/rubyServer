require 'test/unit'
require_relative '../../negocio/peticion_service'
require_relative '../../datos/init_datamapper'

class TestPeticionService < Test::Unit::TestCase

  init_datamapper

  def test_listar_todas_las_peticiones_destacadas
    todas = PeticionService.new.listar_destacadas
    assert_equal todas.count, 2
  end

  def test_mostrar_peticion_con_una_id
    peticion = PeticionService.new.mostrar_peticion(1)
    assert_equal peticion.id, 1
  end
end