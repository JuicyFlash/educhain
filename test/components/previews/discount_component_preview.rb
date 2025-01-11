class DiscountComponentPreview < ViewComponent::Preview
  def with_first_course
    render(DiscountComponent.new(item: Course.find(1)))
  end

  def with_second_course
    render(DiscountComponent.new(item: Course.find(2)))
  end
end
