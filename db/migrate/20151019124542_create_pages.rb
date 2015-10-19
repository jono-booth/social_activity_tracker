class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :url
      t.integer :score
      t.timestamps
    end
  end
end
