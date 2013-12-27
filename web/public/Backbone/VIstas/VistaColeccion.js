/**
 * Created with JetBrains RubyMine.
 * User: adi
 * Date: 16/11/13
 * Time: 17:26
 * To change this template use File | Settings | File Templates.
 */
var VistaColeccion = Backbone.View.extend ({
    el: '#id_comment',
    initialize: function(){
        this.collection.on('reset add remove sync', this.render, this)
    },
    render: function(){
        this.$el.html('');
        var local = this.$el;
        this.collection.forEach(function(actualizacion){
            var vista = new VistaActualizacion({model: actualizacion});
            local.append(vista.render().el);
        });

        local.append('<textarea id="textocomentario"></textarea><input type="submit" id="id_commentar" value="comentar">');
   },
   events: {
       'click #id_commentar': 'addActualizacion'
   },
   addActualizacion: function(){
       var actualizacion = new ModeloActualizacion({contenido: this.$el.find('#textocomentario').val()});
       this.collection.add(actualizacion);
       actualizacion.save();
   }
});