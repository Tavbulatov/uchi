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
require 'rails_helper'

RSpec.describe Classroom, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:students).dependent(:destroy) }
    it { is_expected.to belong_to(:school) }
  end

  describe 'validations' do
    subject { create(:classroom) }

    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_presence_of(:letter) }

    it { is_expected.to validate_uniqueness_of(:number).scoped_to(:school_id) }
  end
end
