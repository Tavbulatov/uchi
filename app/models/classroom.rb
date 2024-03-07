# frozen_string_literal: true

# == Schema Information
#
# Table name: classrooms
#
#  id         :bigint           not null, primary key
#  school_id  :bigint           not null
#  number     :integer          not null
#  letter     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Classroom < ApplicationRecord
  has_many :students, dependent: :destroy
  belongs_to :school

  validates :number, :letter, presence: true
  validates :number, uniqueness: { scope: :school_id }
end
