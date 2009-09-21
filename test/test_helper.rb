require 'rubygems'
require 'test/unit'
require 'shoulda'

class Test::Unit::TestCase
  def load_fixture_as_io(fixture)
    File.open(File.join(File.dirname(__FILE__), "fixtures", fixture), "r")
  end
end
