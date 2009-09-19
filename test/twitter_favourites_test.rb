require 'rubygems'
require 'twitter_favourites'
require 'test/unit'
require 'shoulda'

class TwitterFavouriteTests < Test::Unit::TestCase
  context "get_favourites_from_feed" do
    setup do
      @favourites = TwitterFavourite.get_from_feed(File.open("fixtures/favourite.rss", "r"))
    end

    should "return an array" do
      assert_kind_of(Array, @favourites)
    end

    should "only get tweets that contain URLS" do
      assert_equal(2, @favourites.length)
    end
  end

  context "TwitterFavourite class" do
    setup do
      @favourite = TwitterFavourite.get_from_feed(File.open("fixtures/favourite.rss", "r"))[0]
    end

    should "make the url available" do
      assert_equal("http://bit.ly/Hc5ct", @favourite.url)
    end
  end
end
