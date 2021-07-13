class HomePage
  include PageObject
  page_url "http://puppies.herokuapp.com/"

  buttons(:lstViewDetails, Class: 'rounded_button')
  elements(:lstName, xpath: "//div[@class='name']/h3")

  def clickViewDetails (name)
    index =  extract_indexName(name)
    lstViewDetails_elements[index].click
  end

  def extract_indexName(name)
    lstName_elements.find_index { |x| x = name }
  end

end