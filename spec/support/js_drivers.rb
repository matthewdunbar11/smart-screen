Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app,
    browser: :remote,
    desired_capabilities: :chrome,
    url: "http://chrome:4444/wd/hub"
  )
 end

Capybara.server_host = 'ruby'
# Capybara.server_port = 9000
# Capybara.app_host = "http://ruby:#{Capybara.server_port}"

Capybara.javascript_driver = :chrome