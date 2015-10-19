class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :url
      t.string :uuid
      t.integer :score, default: 0
      t.timestamps
    end
  end
end
