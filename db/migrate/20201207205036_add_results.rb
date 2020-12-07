class AddResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.references :word, foreign_key: true, index: { unique: true }
      t.integer :positives, default: 0
      t.integer :negatives, default: 0

      t.timestamps null: true
    end
  end
end
