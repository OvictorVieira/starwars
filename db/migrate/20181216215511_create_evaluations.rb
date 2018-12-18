class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.integer :film_api_id, null: false
      t.integer :user_id, null: false
      t.integer :evaluation, null: false

      t.timestamps
    end
  end
end
