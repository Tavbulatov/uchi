# frozen_string_literal: true

class ClassroomsController < ApplicationController
  def index
    classrooms = School.find(params[:school_id]).classrooms

    render json: extract_attributes(ClassroomSerializer, classrooms)
  end
end
