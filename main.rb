require 'rubygems'
require 'sinatra'
require 'nokogiri'
require 'open-uri'
require 'builder'

get '/' do
  content_type 'text/xml'
  doc = Nokogiri::XML(open('http://twitter.com/favorites/40573.rss'))
  tweet_elements = doc.xpath('/rss/channel/item/title')
  f = Builder::XmlMarkup.new(:indent => 2)

  f.rss {
    f.channel {
      f.title "Links from twitter favorites" 
      tweet_elements.each do |element|
        f.item {
          f.title element.inner_text
          f.description element.inner_text
        }
      end
    }
  }
end
