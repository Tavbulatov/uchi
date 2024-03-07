# frozen_string_literal: true

class StudentsController < ApplicationController
  def index
    students = School.find(params[:school_id]).classrooms.find(params[:classroom_id]).students

    render json: extract_attributes(StudentSerializer, students)
  end
end
