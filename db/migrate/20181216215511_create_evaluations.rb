class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.boolean :like, null: false
      t.boolean :dislkie, null: false
      t.integer :user_id, foreign_key: true
      t.integer :film_id, foreign_key: true

      t.timestamps
    end
  end
end
