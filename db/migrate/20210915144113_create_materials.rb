# frozen_string_literal: true

class CreateMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :materials do |t|
      t.string :type, null: false
      t.string :body
      t.integer :order, null: false
      t.index [:lesson_id, :order], unique: true
      t.references :lesson

      t.timestamps
    end
  end
end
