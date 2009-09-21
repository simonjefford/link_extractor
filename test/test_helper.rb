require 'rubygems'
require 'test/unit'
require 'shoulda'

class Test::Unit::TestCase
  def load_fixture_as_io(fixture)
    File.open(fixture_path(fixture), "r")
  end

  private

  def fixture_path(fixture)
    File.join(File.dirname(__FILE__), "fixtures", fixture)
  end
end
