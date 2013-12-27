class TestApi < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    ServidorAPI
  end

  def body_includes *args
    args.each do |arg|
      assert last_response.body.include?(arg), arg
    end
  end

  def test_obtenemos_al_usuario_logueado
    get '/usuarios', :login => 'adi@ua.es'

  end
end