# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Students::RegistrationsController, type: :controller do
  before do
    @request.env['devise.mapping'] = Devise.mappings[:student]
  end

  describe 'DELETE #destroy  /students_path' do
    let!(:student) { create_list(:student, 2) }

    it 'destroys the student' do
      sign_in(student.first)
      expect do
        delete :destroy, params: { student_id: student.last }
      end.to change(Student, :count).by(-1)
    end
  end
end
