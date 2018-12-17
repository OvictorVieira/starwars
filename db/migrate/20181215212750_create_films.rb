class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :title, null: false
      t.string :episode, null: false
      t.string :director, null: false
      t.string :release_date, null: false
      t.integer :api_id, null: false

      t.timestamps
    end
  end
end
