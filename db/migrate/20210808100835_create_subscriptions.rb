# frozen_string_literal: true

class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'hstore'
    create_table :subscriptions do |t|
      t.hstore :completed_lessons, default: {}, null: false
      t.references :user, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
