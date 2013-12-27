require_relative '../datos/PeticionDAO'

class PeticionService
  def listar_destacadas()
    PeticionDAO.new.listar_destacadas
  end
end