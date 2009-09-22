require 'test_helper'
require 'main'
require 'fakeweb'
require 'rack/test'
require 'net/http'

class MainTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  context "fetch '/'" do
    setup do
      FakeWeb.allow_net_connect = false
      feed_text = load_fixture_as_string("favourite.rss")
      FakeWeb.register_uri(:get, 'http://twitter.com/favorites/40573.rss', :body => feed_text)
      get '/'
    end

    should "return an OK HTTP status" do
      assert last_response.ok?
    end
  end
end
