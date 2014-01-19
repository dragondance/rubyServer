#clases tontas
require 'data_mapper'

class Firma
  include DataMapper::Resource

  property :id, Serial, :key => true
  property :publica, Boolean
  property :comentario, Text
  property :nombre, String
  property :apellidos, String
  property :email, String
  property :peticion_id, Integer

end