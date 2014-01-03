require_relative '../dominio/usuario'

class UsuarioDAO
  def mostrar_usuario(login)
    Usuario.get(login)
  end

  def autentificar(login, password)
    Usuario.first(:login => login, :password => password)
  end
end