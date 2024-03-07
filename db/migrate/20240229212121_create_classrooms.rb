# frozen_string_literal: true

class CreateClassrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :classrooms do |t|
      t.references :school, null: false, foreign_key: true
      t.integer :number, null: false
      t.string :letter, null: false

      t.timestamps
    end
  end
end
