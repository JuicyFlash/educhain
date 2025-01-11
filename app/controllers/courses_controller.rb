class CoursesController < ApplicationController
  def index
    @courses = CourseComponent.with_collection(Course.all, notice: "Buy Me")
  end
end
