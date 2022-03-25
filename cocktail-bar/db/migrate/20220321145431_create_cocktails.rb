# frozen_string_literal: true

class CreateCocktails < ActiveRecord::Migration[7.0]
  def change
    create_table :cocktails do |t|
      t.string :name, null: false
      t.text :picture, null: false
      t.references :category, null: false, foreign_key: true
      t.text :instructions, null: false
      t.integer :like, null: false
      t.integer :rating, null: false

      t.timestamps
    end
  end
end
