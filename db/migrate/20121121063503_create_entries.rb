class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.text :input

      t.timestamps
    end
  end
end
