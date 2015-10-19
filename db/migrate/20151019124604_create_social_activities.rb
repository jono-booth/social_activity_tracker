class CreateSocialActivities < ActiveRecord::Migration
  def change
    create_table :social_activities do |t|
      t.integer :value, default: 0
      t.string  :user_ip
      t.timestamps
    end
    add_reference :social_activities, :page, index: true, foreign_key: true
  end
end
