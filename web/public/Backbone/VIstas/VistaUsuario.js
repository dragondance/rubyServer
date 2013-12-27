/**
 * Created with JetBrains RubyMine.
 * User: adi
 * Date: 23/11/13
 * Time: 20:56
 * To change this template use File | Settings | File Templates.
 */
var VistaUsuario = Backbone.View.extend ({
    tagName: 'form',
    template: Mustache.compile('<div><p class="text" name="nombre">Nombre:</p><input name="nombre" class ="form" id="input-nombre" type="text"><p class="text">Apellidos:</p><input class="form" id="input-apellidos" type="text"><p class="text">Antigua contraseña:</p><input class="form" id="input-oldpass" type="password"><p class="text">Nueva Contraseña:</p><input class="form" id="input-newpass" type="password"><p class="text">Confirmar Contraseña:</p><input class="form" id="input-renewpass" type="password"><button class="linkEnter" id="enviarDatos">Guardar Cambios</button></div>'),
    render: function(){
        this.$el.html(this.template);
        $('#user-editcontent').append(this.$el);
        this.$el.find('#input-nombre').val(this.model.get('nombre'));
        this.$el.find('#input-apellidos').val(this.model.get('apellidos'));
        return this;
    },
    initialize:function(){
        this.model.on('change', this.render, this);
    },
    events:{
        'click #enviarDatos': 'editarDatos'
    },
    editarDatos: function() {
        var json = {
            login: this.model.get('login'),
            nombre: $('#input-nombre').val(),
            apellidos: $('#input-apellidos').val()
        };
        if($('#input-pass').val() != "" && $('#input-newpass').val() === $('#input-renewpass').val()){
            json.oldPassword = $('#input-oldpass').val();
            json.newPassword = $('#input-newpass').val();
        }
        var usuario= new Usuario(json);
        console.log(usuario.toJSON());
        usuario.save();
        this.model = usuario;
    }

});