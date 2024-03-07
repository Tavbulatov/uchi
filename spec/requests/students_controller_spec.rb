# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StudentsController, type: :request do
  let(:school) { build(:school) }
  let(:classroom) { build(:classroom, school: school) }
  let(:students) { create_list(:student, 2, school: school, classroom: classroom) }

  describe 'GET /schools/:school_id/classrooms/:classroom_id/students' do
    before do
      sign_in students.first
      get school_classroom_students_path(school, classroom)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns all students for a classroom' do
      expect(json).to eq(extract_attributes(StudentSerializer ,students))
    end
  end
end
