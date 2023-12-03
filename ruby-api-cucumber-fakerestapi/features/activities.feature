Feature: Activities API Testing
  As a user, I want to test the Activities API endpoints

  Scenario: Get list of activities
    Given I send a "GET" request to "https://fakerestapi.azurewebsites.net/api/v1/Activities"
    Then the response status code should be 200
    Then the response body should contain a list of activities

  Scenario: Create a new activity
    Given I send a "POST" request to "https://fakerestapi.azurewebsites.net/api/v1/Activities" with the following body:
      """
        {
          "id": 31,
          "title": "test31",
          "dueDate": "2023-12-02T11:28:41.292Z",
          "completed": true
        }
      """
    Then the response status code should be 200

  Scenario: Update an existing activity with id 1
    Given I send a "PUT" request to "https://fakerestapi.azurewebsites.net/api/v1/Activities/1" with the following body:
      """
        {
          "id": 1,
          "title": "Test - Update id 1",
          "dueDate": "2023-12-02T11:28:41.292Z",
          "completed": true
        }
      """
    Then the response status code should be 200

  Scenario: Delete an existing activity with id 1
    And I send a "DELETE" request to "https://fakerestapi.azurewebsites.net/api/v1/Activities/1"
    Then the response status code should be 200
