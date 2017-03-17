class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :title
      t.text :body
      t.boolean :private, default: false

      t.timestamps null: false
    end
  end
end
