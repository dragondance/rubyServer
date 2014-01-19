require_relative '../dominio/firma'

class FirmaDAO
  def crear_firma(publica, comentario, nombre, apellidos, email, id)
    f = Firma.create(:publica => publica, :comentario => comentario, :nombre => nombre, :apellidos => apellidos, :email => email, :peticion_id => id)
  end
end