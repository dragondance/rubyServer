/**
 * Created with JetBrains RubyMine.
 * User: adi
 * Date: 23/11/13
 * Time: 20:44
 * To change this template use File | Settings | File Templates.
 */
var Usuario = Backbone.Model.extend ({
    idAttribute: 'login',
    url: 'api/usuarios/' + localStorage.getItem('login')
});