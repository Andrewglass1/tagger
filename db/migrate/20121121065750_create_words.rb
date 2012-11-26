class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.text :text
      t.string :part_of_speech
      t.integer :entry_id
      t.integer :count

      t.timestamps
    end
  end
end
