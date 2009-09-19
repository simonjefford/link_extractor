require 'rubygems'
require 'sinatra'
require 'nokogiri'
require 'open-uri'
require 'builder'

get '/' do
  content_type 'text/xml'
  f = Builder::XmlMarkup.new(:indent => 2)

  f.rss {
    f.channel {
      f.title "Links from twitter favorites"
      get_favourites.each do |element|
        f.item {
          f.title element
          f.description element
        }
      end
    }
  }
end

helpers do
  def get_favourites
    doc = Nokogiri::XML(open('http://twitter.com/favorites/40573.rss'))
    doc.xpath('/rss/channel/item/title').map do |element|
      element.inner_text.split.grep(/http[s]?:\/\/\w/)
    end.flatten
  end
end
