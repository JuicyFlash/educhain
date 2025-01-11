module CoursesHelper
  def count_enrollees(course)
    count = (course.price / 4).round()
    tag.p "#{count} enrollees so far"
  end

  def star_icon
    tabler_icon 'star-filled', color: :orange, size: 20, class: 'filled'
  end
end
