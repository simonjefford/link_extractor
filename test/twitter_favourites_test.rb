require 'test_helper'
require 'twitter_favourites'

class TwitterFavouriteTests < Test::Unit::TestCase
  context "get_favourites_from_feed" do
    setup do
      @favourites = TwitterFavourite.get_from_feed(load_fixture_as_io("favourite.rss"))
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
      @favourite = TwitterFavourite.get_from_feed(load_fixture_as_io("favourite.rss"))[0]
    end

    should "make the url available" do
      assert_equal("http://bit.ly/Hc5ct", @favourite.url)
    end

    should "make the pub date available" do
      assert_equal("Fri, 18 Sep 2009 16:54:08 +0000", @favourite.pub_date)
    end

    should "make the guid available" do
      assert_equal("http://twitter.com/MacRuby/statuses/4082752004", @favourite.guid)
    end
  end
end
