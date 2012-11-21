class Word < ActiveRecord::Base
  attr_accessible :entry_id, :part_of_speech, :text
  belongs_to :entry
end
