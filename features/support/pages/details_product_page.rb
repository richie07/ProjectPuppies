class DetailsProductPage
  include PageObject

  button(:completeAdoption, xpath: "//input[@class='rounded_button']", index: 0)
  button(:btnAdoptAnotherPuppy, xpath: "//input[@class='rounded_button']", index: 1)
  elements(:lstNamesPrices, xpath: '//tbody//img/ancestor::tr//h2')
  element(:lblTotal, css: "td[class='total_cell'] > h2")

  def getName(index)
    lstNamesPrices_elements[(index - 1) * 3].text

  end

  def getSubTotal(index)
    lstNamesPrices_elements[((index - 1) * 3) + 2].text
  end

end