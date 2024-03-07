# frozen_string_literal: true

# == Schema Information
#
# Table name: students
#
#  id                     :bigint           not null, primary key
#  first_name             :string           not null
#  last_name              :string           not null
#  surname                :string           not null
#  classroom_id           :bigint           not null
#  school_id              :bigint           not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  jti                    :string           not null
#
class StudentSerializer
  include JSONAPI::Serializer
  attributes :id, :first_name, :last_name, :surname, :classroom_id, :school_id
end
