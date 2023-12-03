require 'selenium-webdriver'

Given('I am on the Saucedemo login page') do
  @driver.get('https://www.saucedemo.com/')
end

When('I log in with username {string} and password {string}') do |username, password|
  @driver.find_element(:id, 'user-name').send_keys(username)
  @driver.find_element(:id, 'password').send_keys(password)
  @driver.find_element(:id, 'login-button').click
end

Then('I should see the products page') do
  wait = Selenium::WebDriver::Wait.new(timeout: 10)
  wait.until { @driver.find_element(:class, 'inventory_list') }
end

Given('I am logged in') do
  @driver.get('https://www.saucedemo.com/')
  @driver.find_element(:id, 'user-name').send_keys('standard_user')
  @driver.find_element(:id, 'password').send_keys('secret_sauce')
  @driver.find_element(:id, 'login-button').click
end

When('I add the first product to the cart') do
  @driver.find_element(:class, 'btn_inventory').click
end

Then('I should see the cart with the added product') do
  wait = Selenium::WebDriver::Wait.new(timeout: 10)
  wait.until { @driver.find_element(:class, 'shopping_cart_badge') }
end
