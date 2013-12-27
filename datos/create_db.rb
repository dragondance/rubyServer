#encoding: utf-8
require_relative '../dominio/peticion'
require_relative '../dominio/usuario'
require_relative '../datos/init_datamapper'

require 'data_mapper'

init_datamapper
DataMapper.auto_migrate!
usu1 = Usuario.create(:login => 'adi@ua.es', :password => 'adi')
usu1.peticiones.create(:titulo => 'Esta es la peticion 1', :destacada => true, :firmasConseguidas => 100)
