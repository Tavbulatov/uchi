# frozen_string_literal: true

class AddColumnToStudent < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :jti, :string, null: false
    add_index :students, :jti, unique: true
  end
end
