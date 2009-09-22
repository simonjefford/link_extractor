require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'fakeweb'

FakeWeb.allow_net_connect = false

class Test::Unit::TestCase
  def load_fixture_as_io(fixture)
    File.open(fixture_path(fixture), "r")
  end

  def load_fixture_as_string(fixture)
    File.read(fixture_path(fixture))
  end

  private

  def fixture_path(fixture)
    File.join(File.dirname(__FILE__), "fixtures", fixture)
  end
end
