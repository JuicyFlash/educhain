class CoursesController < ApplicationController
  def index
    @courses = Course.all
    @course_titles = Course.all.pluck(:title).map { |title| { title: title } }
  end
end
