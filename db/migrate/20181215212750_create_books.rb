class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :episode
      t.string :manager
      t.string :release_year
      t.boolean :like, null: true
      t.boolean :dislike, null: true

      t.timestamps
    end
  end
end
