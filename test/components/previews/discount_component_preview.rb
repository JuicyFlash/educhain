class DiscountComponentPreview < Lookbook::Preview
  # Компонент отображается если цена курса >= 100
  # @label Available
  # @param course_price
  def available_discount(course_price: '135.23')
    render(DiscountComponent.new(item: Course.new(title: 'Some title', price: course_price, location: 'Moscow')))
  end
end
