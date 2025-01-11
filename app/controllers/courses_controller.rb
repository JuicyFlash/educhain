class CoursesController < ApplicationController
  def index
    @courses = CourseComponent.with_collection(Course.all, notice: "Buy Me")
    @course_titles = Course.all.pluck(:title).map { |title| { title: title } }
  end
end
