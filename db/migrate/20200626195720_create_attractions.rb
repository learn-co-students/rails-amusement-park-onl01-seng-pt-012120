
# "name", "nausea_rating", "happiness_rating", "tickets", "min_height"],

class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string  :name
      t.string  :nausea_rating
      t.string  :hapiness_rating
      t.integer :tickets
      t.integer :min_height

      t.timestamps 
    end
  end
end
