require 'data_mapper'
require_relative 'peticion'
class Usuario
  include DataMapper::Resource

  property :login, String, :key => true, :unique => true
  property :password, String, :required => true
  property :nombre, String, :required => true
  property :apellidos, String, :required => true
  has n, :peticiones, 'Peticion'
end