class CreateTrainingSets < ActiveRecord::Migration[7.0]
  def change
    create_table :training_sets do |t|
      t.references :workout, null: false, foreign_key: true
      t.references :exercise, null: false, foreign_key: true
      t.integer :repetitions
      t.float :weight

      t.timestamps
    end
  end
end
