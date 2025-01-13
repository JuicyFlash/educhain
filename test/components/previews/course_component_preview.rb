class CourseComponentPreview <  Lookbook::Preview
  # Скидка отображается если цена курса >= 100
  # @label Course
  # @param notice text
  # @param course_title text
  # @param course_price number
  # @param course_location text
  def course(notice: "Buy", course_title: 'Some title', course_price: '135.23', course_location: 'Moscow')
    render CourseComponent.new(item: Course.new(title: course_title, price: course_price, location: course_location), notice: notice, item_counter: 0)
  end

  # Скидка отображается если цена курса >= 100
  # @param notice text
  def courses_collection(notice: "Buy")
    @curses_collection = []
    5.times do |i|
      @curses_collection << Course.new(
        title: Faker::Educator.course_name,
        price: Faker::Commerce.price(range: 80..200.0, as_string: true),
        location: Faker::Address.city)
     end
    render CourseComponent.with_collection(@curses_collection, notice: notice)
  end
end
