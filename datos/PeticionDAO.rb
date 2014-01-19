require_relative '../dominio/peticion'

class PeticionDAO
  def listar_destacadas()
    Peticion.all(:destacada => true)
  end

  def mostrar_peticion(id)
    Peticion.get(id)
  end

  def crear_peticion(titulo, fin, texto, firmasObjetivo)
    p = Peticion.create(:titulo => titulo,:firmasConseguidas => 0, :destacada => false, :firmasObjetivo => firmasObjetivo, :abierta => false, :conseguida => false, :inicio => Date.new, :fin => fin, :texto => texto)
  end

  def firmar_peticion(id)
    p = mostrar_peticion(id)
    firmas = p.firmasConseguidas + 1
    p.update(:firmasConseguidas => firmas)
  end
end