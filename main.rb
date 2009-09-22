require 'sinatra'
require 'open-uri'
require 'builder'
require 'twitter_favourites'

get '/' do
  content_type 'text/xml'
  response['Cache-Control'] = "public, max-age=3600"
  f = Builder::XmlMarkup.new(:indent => 2)
  favourites = TwitterFavourite.get_from_feed(open('http://twitter.com/favorites/40573.rss'))

  f.rss {
    f.channel {
      f.title "Links from twitter favorites"
      favourites.each do |favourite|
        f.item {
          f.title favourite.url
          f.description favourite.url
          f.pubDate favourite.pub_date
        }
      end
    }
  }
end
