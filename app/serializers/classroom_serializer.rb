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
class ClassroomSerializer
  include JSONAPI::Serializer
  attributes :id, :number, :letter

  attribute :students_count do |object|
    object.students.count
  end
end
