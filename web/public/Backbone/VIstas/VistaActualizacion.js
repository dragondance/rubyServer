/**
 * Created with JetBrains RubyMine.
 * User: adi
 * Date: 16/11/13
 * Time: 15:31
 * To change this template use File | Settings | File Templates.
 */
var VistaActualizacion = Backbone.View.extend ({
    tagName: 'tr',
    template: Mustache.compile('<p>{{fecha}}</p><p class="content-comentario">{{contenido}}</p><button class="destruir" >delete</button><button class="editar" >edit</button><hr></hr>'),
    render: function(){
        this.$el.html(this.template(this.model.toJSON()));
        return this;
    },
    events:{
        'click .destruir': 'deleteActualizacion',
        'click .editar': 'editActualizacion',
        'click .guardar': 'guardarCambios',
        'click .cancelar': 'cancelarCambios'
    },
    deleteActualizacion: function(){
        this.model.destroy();
    },
    editActualizacion: function() {
        var val = this.model.get('contenido');
        //this.$el.find('.content-comentario').replaceWith('<textarea class="content-comentario"></textarea>');
        this.$el.find('.content-comentario').hallo({editable:true, toolbar: 'halloToolbarFixed', plugins:{'halloformat': {} }}).focus();
        /*var contenido = this.$el.find('.content-comentario');
        contenido.val(val);
        contenido.focus();  */

        this.$el.find('.destruir').replaceWith('<button class="guardar">guardar</button>');

        this.$el.find('.editar').replaceWith('<button class="cancelar">cancelar</button>')
    },
    guardarCambios: function(){
        var contenido = this.$el.find('.content-comentario');
        this.model.set('contenido', contenido.html());
        this.model.save();

        this.$el.find('.guardar').replaceWith('<button class="destuir">delete</button>');

        this.$el.find('.cancelar').replaceWith('<button class="editar">edit</button>');
    },
    cancelarCambios: function() {
        var val = this.model.get('contenido');

        //this.$el.find('.content-comentario').replaceWith('<p class="content-comentario"></p>');
        this.$el.find('.content-comentario').hallo({editable:false}).focus();

        this.$el.find('.content-comentario').html(val);

        this.$el.find('.guardar').replaceWith('<button class="destuir">delete</button>');

        this.$el.find('.cancelar').replaceWith('<button class="editar">edit</button>');
    }
});
