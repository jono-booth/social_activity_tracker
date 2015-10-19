class CreateWeightings < ActiveRecord::Migration
  def change
    create_table :weightings do |t|
      t.integer :network
      t.string  :field
      t.integer :count

      t.timestamps
    end
    add_reference :weightings, :social_activities, index: true, foreign_key: true
  end
end
