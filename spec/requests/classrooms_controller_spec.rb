# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ClassroomsController, type: :request do
  let(:school) { create(:school) }
  let(:classrooms) { create_list(:classroom, 2, school: school) }
  let(:student) { create(:student, classroom: classrooms.first ) }

  describe 'GET /schools/:school_id/classrooms' do
    before do
      sign_in student
      get school_classrooms_path(school)
    end

    it 'returns success status' do
      expect(response).to have_http_status(:success)
    end

    it 'returns all classes for a school' do
      expect(json).to eq(extract_attributes(ClassroomSerializer ,classrooms).as_json)
    end
  end
end
