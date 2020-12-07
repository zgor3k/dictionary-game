class AddWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.string :word
      t.index :word, unique: true
      t.string :translated_word

      t.timestamps null: true
    end
  end
end
