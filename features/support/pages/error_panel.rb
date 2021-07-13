module ErrorPanel
  include PageObject
  div(:error, id: 'error_explanation')

  unordered_list(:errores) do |page|
    page.error_element.unordered_list_element

  end
end