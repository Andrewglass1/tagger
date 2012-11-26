require 'nokogiri'
require 'open-uri'

class Article < ActiveRecord::Base
  include HTTParty
  attr_accessible :link, :headline, :author

  def self.fetch_popular
    response = HTTParty.get("http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/1?api-key=#{$nytkey}")
    response["results"].each do |article|
      Article.create(link: article['url'], author: article['byline'], headline: article['title'])
    end
  end

  def retreive_text
    doc = Nokogiri::HTML(open(link))
    doc.css('p').text
  end

  def create_entry_for
    Entry.create(:input => retreive_text)
  end
end
