# frozen_string_literal: true

class AddIndexToStudentsFirstNameAndLastName < ActiveRecord::Migration[7.0]
  def change
    add_index :students, %i[first_name last_name], unique: true
  end
end
