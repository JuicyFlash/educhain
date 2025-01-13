class ListComponentPreview < Lookbook::Preview
  def courses_list
    @course_titles = []
    5.times do
      @course_titles << { title: Faker::Educator.course_name }
    end
    render ListComponent.new do |c|
       c.with_header do
          "List of Available Courses"
       end
       c.with_titles(@course_titles)
    end
  end
end
