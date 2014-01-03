require_relative '../datos/UsuarioDAO'

class UsuarioService
  def mostrar_usuario(login)
    UsuarioDAO.new.mostrar_usuario(login)
  end

  def autentificar(login, password)
    UsuarioDAO.new.autentificar(login, password)
  end
end