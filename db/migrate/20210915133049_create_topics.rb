# frozen_string_literal: true

class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.string :name, null: false
      t.integer :order, null: false
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
