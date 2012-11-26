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
      word = Word.find_or_create_by_text_and_entry_id(text: split_pair[0], part_of_speech: split_pair[1], entry_id: self.id, count: 0)
      word.count += 1
      word.save!
    end
  end

end
