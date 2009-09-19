require 'nokogiri'

class XPathExtension
  def matches_regex(node_set, regex)
    node_set.find_all do |node|
      b = node.inner_text =~ /#{regex}/
    end
  end
end

class TwitterFavourite
  URL_REGEX = 'http[s]?:\/\/\w'

  def self.get_from_feed(feed)
    doc = Nokogiri::XML(feed)
    ext = XPathExtension.new
    doc.xpath("/rss/channel/item[matches_regex(title, '#{URL_REGEX}')]", ext).map do |element|
      self.new(element)
    end
  end

  def initialize(rss_element)
    @rss_element = rss_element
  end

  def url
    @rss_element.xpath('title').inner_text.split.grep(/#{URL_REGEX}/)[0]
  end
end

