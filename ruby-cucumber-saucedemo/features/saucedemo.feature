Feature: Saucedemo Login
  Scenario: Successful login to saucedemo
    Given I am on the Saucedemo login page
    When I log in with username "standard_user" and password "secret_sauce"
    Then I should see the products page

  Scenario: Add item to cart
    Given I am logged in
    When I add the first product to the cart
    Then I should see the cart with the added product