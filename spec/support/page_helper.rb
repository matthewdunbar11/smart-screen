class PageHelper
  class << self
    include Rails.application.routes.url_helpers
    include Capybara::DSL
  end
end
