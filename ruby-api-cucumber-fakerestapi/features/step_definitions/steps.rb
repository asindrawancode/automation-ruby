require 'httparty'
require 'json'

Given('I send a {string} request to {string}') do |http_method, url|
  @response = HTTParty.send(http_method.downcase, url)
end

Then('the response status code should be {int}') do |expected_status_code|
  actual_status_code = @response.code
  expect(actual_status_code).to eq(expected_status_code)
end

Then('the response body should contain a list of activities') do
    response_body = JSON.parse(@response.body)
    expect(response_body).to be_an_instance_of(Array)
  end

Given('I send a {string} request to {string} with the following body:') do |http_method, url, body|
    headers = {
      'Content-Type' => 'application/json'
    }
    @response = HTTParty.send(http_method.downcase, url, body: body, headers: headers)
  end
