Given('I am on the puppy adoption site') do
  visit(HomePage)
end

When('I click the View Details button for {string}') do |name|
  on(HomePage).clickViewDetails name
  sleep 2
end

When('I click the Adopt Me button') do
  on(DetailsPage).AdopteMe
  sleep 2
end

When('I click the Complete the Adoption button') do
  on(DetailsProductPage).completeAdoption
  sleep 2
end

When('I enter {string} in the name field') do |name|
  on(DetailsFormPage).name = name
end

When('I enter {string} in the address field') do |address|
  on(DetailsFormPage).address = address
end

When('I enter {string} in the email field') do |email|
  on(DetailsFormPage).email = email
end

When('I select {string} from the pay with dropdown') do |pay_type|
  on(DetailsFormPage).pay_type = pay_type
end

When('I click the Place Order button') do
  on(DetailsFormPage).placeOrder
  sleep 5
end

Then('I should see {string}') do |message|
  on(HomePage).text.should include message
end

When('I click the Adopt Another Puppy button') do
  on(DetailsProductPage).btnAdoptAnotherPuppy
  sleep 2
end

When('I click the second View Details button') do
  on(HomePage).clickViewDetails 1
  sleep 2
end

Then('I should see {string} as the name for line item {int}') do |name, item|
  on(DetailsProductPage).getName(item).should include name

end

Then('I should see {string} as the subtotal for line item {int}') do |subtotal, item|
  on(DetailsProductPage).getSubTotal(item).should include subtotal
end

Then('I should see {string} as the cart total') do |total|
  on(DetailsProductPage).lblTotal.should include total
end

When('I complete the adoption in table') do |table|
  on(DetailsFormPage).checkout(table.hashes.first)
end

When('I complete the adoption with name') do
  on(DetailsFormPage).checkout('name' => '')
  sleep 2
end

Then('I should see the error message {string}') do |message|
  @current_page.errores.should include message
end