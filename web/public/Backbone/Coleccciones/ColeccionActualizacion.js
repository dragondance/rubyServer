/**
 * Created with JetBrains RubyMine.
 * User: adi
 * Date: 16/11/13
 * Time: 15:27
 * To change this template use File | Settings | File Templates.
 */
var ColeccionActualizacion = Backbone.Collection.extend({
    model: ModeloActualizacion,
    url: 'api/peticiones/' + id_peticion + '/actualizaciones'
});