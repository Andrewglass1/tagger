require 'engtagger'
require 'nokogiri'

class Entry < ActiveRecord::Base
  attr_accessible :input
  has_many :words, :dependent => :destroy
  after_create :tagged

  def tagged
    parser = EngTagger.new
    tagged = parser.get_readable(input)
    tagged.split(" ").each do |wordpair|
      split_pair = wordpair.split("/")
      Word.create(text: split_pair[0], part_of_speech: split_pair[1], entry_id: self.id)
    end
  end
end
