#clases tontas
require 'data_mapper'
require_relative '../dominio/usuario'
class Peticion
  include DataMapper::Resource

  property :id, Serial
  property :titulo, String
  property :firmasConseguidas, Integer
  property :destacada, Boolean
  #TODO - FALTAN CAMPOS

  belongs_to :usuario

  #para cuando se llame en la plantilla a {{creador}}
  def creador
    usuario
  end
end