class ListComponent < ViewComponent::Base
  renders_one :header, "HeaderComponent"
  renders_many :titles, TitleComponent

  class HeaderComponent < ViewComponent::Base
    def call
      content_tag :h1, content
    end
  end
end
