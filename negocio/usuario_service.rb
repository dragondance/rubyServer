require_relative '../datos/UsuarioDAO'

class UsuarioService
  def mostrar_usuario(login)
    UsuarioDAO.new.mostrar_usuario(login)
  end

  def autentificar(login, password)
    UsuarioDAO.new.autentificar(login, password)
  end

  def registrar(nombre, apellidos, login, password)
    UsuarioDAO.new.registrar(nombre, apellidos, login, password)
  end

  def loginDisponible(login)
    usuario = UsuarioDAO.new.mostrar_usuario(login)
    if(usuario)
      false
    else
      true
    end
  end
end