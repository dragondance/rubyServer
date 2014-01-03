require_relative '../datos/PeticionDAO'

class PeticionService
  def listar_destacadas()
    PeticionDAO.new.listar_destacadas
  end

  def mostrar_peticion(id)
     PeticionDAO.new.mostrar_peticion(id)
  end
end