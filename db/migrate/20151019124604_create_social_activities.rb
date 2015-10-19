class CreateSocialActivities < ActiveRecord::Migration
  def change
    create_table :social_activities do |t|
      t.string :name
      t.integer :count
      t.timestamps
    end
    add_reference :social_activities, :pages, index: true, foreign_key: true
  end
end
