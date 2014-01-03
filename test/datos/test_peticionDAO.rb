#ENV['RACK_ENV'] = 'test'
require 'test/unit'
#require 'rack/test'
require_relative '../../datos/PeticionDAO'
require_relative '../../datos/init_datamapper'

init_datamapper

class TestPeticionDAO < Test::Unit::TestCase
   def test_todas_las_peticiones_destacadas
     todas = PeticionDAO.new.listar_destacadas
     assert_equal todas.count, 2
   end

   def test_mostrar_una_peticion
    peticion = PeticionDAO.new.mostrar_peticion(1)
    assert_equal peticion.id, 1
   end

end