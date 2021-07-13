Feature: Adopting puppies
  As a puppy lover
  I want to adopt puppies
  So they can chew my furniture

  Background:
    Given I am on the puppy adoption site

  Scenario: Adopting one puppy using partial data
    When  I click the View Details button for "Brook"
    And I click the Adopt Me button
    And I click the Complete the Adoption button
    And I complete the adoption in table
    | email              | pay_type   |
    | richiefpc@gmail.com| Credit card|
    And I click the Place Order button
    Then I should see "Thank you for adopting a puppy!"

  Scenario: Adopting one puppy using all default data
    When  I click the View Details button for "Brook"
    And I click the Adopt Me button
    And I click the Complete the Adoption button
    And I complete the adoption in table
      | pay_type   |
      | Credit card|
    And I click the Place Order button
    Then I should see "Thank you for adopting a puppy!"

  Scenario: Validate cart with two puppies
    When  I click the View Details button for "Brook"
    And I click the Adopt Me button
    And I click the Adopt Another Puppy button
    And I click the View Details button for "Hanna"
    And I click the Adopt Me button
    Then I should see "Brook" as the name for line item 1
    And I should see "$34.95" as the subtotal for line item 1
    And I should see "Hanna" as the name for line item 2
    And I should see "$22.99" as the subtotal for line item 2
    And I should see "$57.94" as the cart total

  Scenario: Name is required in the form
    When  I click the View Details button for "Brook"
    And I click the Adopt Me button
    And I click the Complete the Adoption button
    And I complete the adoption with name
    And I click the Place Order button
    Then I should see the error message "Name can't be blank"