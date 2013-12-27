# encoding: UTF-8

require 'date'
require 'data_mapper'
#añadir el resto de entidades conforme las vayamos implementando
require '../dominio/peticion'
require '../dominio/usuario'
require_relative 'init_datamapper'

init_datamapper

def init_data
  Peticion.destroy
  Usuario.destroy

  texto1 = <<END
  Desde tiempos inmemoriales los humanos han cazado a los berberechos sin piedad.
  Ya basta. Los berberechos deben ser libres.
  Porque los berberechos tienen derechos: Rajoy, promueve una Ley de Protección del Berberecho Salvaje')
END


  texto2 = <<END
  Estamos hartos de tantas prácticas de ADI, por lo que proponemos un sobresaliente general o en su defecto aprobado
END


  u1 = Usuario.create(:login => 'adi@ua.es', :password => 'adi', :nombre => 'Alfonso', :apellidos => 'David Iradier')
  u1.peticiones.create({:titulo =>'Que se proteja al berberecho salvaje',
                        :texto => texto1,
                        :firmasObjetivo => 1000,
                        :firmasConseguidas => 0,
                        :abierta =>true,
                        :conseguida => true,
                        :destacada => true,
                        :inicio => Date.today,
                        :fin => Date.today+60})
  u2 = Usuario.create(:login => 'pepe@ua.es', :password => 'pepe',
                      :nombre => 'Pepe', :apellidos => 'Pérez Martínez')
  u2.peticiones.create(:titulo =>'No queremos más prácticas de ADI',
                       :texto => texto2,
                       :firmasObjetivo => 1000,
                       :firmasConseguidas => 0,
                       :abierta =>true,
                       :conseguida => true,
                       :destacada => true,
                       :inicio => Date.today-10,
                       :fin => Date.today+60)
end


#ahora ejecutamos el código

DataMapper.auto_migrate!
init_data()