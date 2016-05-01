class CreateDictionaries < ActiveRecord::Migration
  def change
    create_table :dictionaries do |t|
      t.string :word,         null: false
      t.string :urlsafe_word, null: false
      t.string :short_explanation, null: false
      t.text   :explanation

      t.integer  :view_count,   null: false, default: 0
      t.datetime :last_view_at

      t.integer :lock_version, null: false, default: 0
      t.timestamps null: false
    end

    add_index :dictionaries, :word,         unique: true
    add_index :dictionaries, :urlsafe_word, unique: true
  end
end
