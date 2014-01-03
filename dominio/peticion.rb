#clases tontas
require 'data_mapper'
require_relative '../dominio/usuario'
class Peticion
  include DataMapper::Resource

  property :id, Serial, :key => true
  property :titulo, String
  property :firmasConseguidas, Integer
  property :destacada, Boolean
  property :firmasObjetivo, Integer
  property :abierta, Boolean
  property :conseguida, Boolean
  property :inicio, Date
  property :fin, Date
  property :texto, Text

  belongs_to :usuario

  #para cuando se llame en la plantilla a {{creador}}
  def creador
    usuario
  end
end