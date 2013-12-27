/**
 * Created with JetBrains RubyMine.
 * User: adi
 * Date: 16/11/13
 * Time: 12:58
 * To change this template use File | Settings | File Templates.
 */
var FirmaView = Backbone.View.extend ({
    template: $('#templateSignature').html(),
    render: function(){
        this.$el.html(this.template);
        $('#signature-form').append(this.$el);
        return this;
    },
    events:{
        'click #sumbitsignature': 'guardarFirma'
    },
    guardarFirma: function(){
        if(localStorage.getItem('usuario')){
            var json = {
                publica: this.$el.find('#id_checksignature').prop('checked'),
                comentario: this.$el.find('#id_checksignature').val()
            };
            var firma= new Firma(json);
            firma.save();
        }
        else {
            var json= {
                publica: this.$el.find('#id_checksignature').prop('checked'),
                comentario: this.$el.find('#id_textdescription').val(),
                nombre: this.$el.find('#id_textname').val(),
                apellidos: this.$el.find('#id_text2name').val(),
                email: this.$el.find('#id_textmail').val()
            };
            var firma= new Firma(json);
            firma.save();
        }
    }
});