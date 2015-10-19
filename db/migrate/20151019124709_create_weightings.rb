class CreateWeightings < ActiveRecord::Migration
  def change
    create_table :weightings do |t|
      t.string  :network
      t.string  :field
      t.integer :value
      t.timestamps
    end
    add_reference :social_activities, :weighting, index: true, foreign_key: true
  end
end
