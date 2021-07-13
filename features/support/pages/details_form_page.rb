require_relative 'error_panel'

class DetailsFormPage
  include PageObject
  include DataMagic
  include ErrorPanel

  # DEFAULT_DATA = {
  #   'name' => Faker::Name.name,
  #   'address' => Faker::Address.street_address,
  #   'email' => Faker::Internet.email,
  #   'pay_type' => 'Purchase order'
  # }.freeze

  text_field(:name, id: 'order_name')
  text_area(:address, id: 'order_address')
  text_field(:email, id: 'order_email')
  select_list(:pay_type, id: 'order_pay_type')
  button(:placeOrder, name: 'commit')

  def checkout(data = {})
    # data = DEFAULT_DATA.merge(data)
    # self.name = data['name']
    # self.address = data['address']
    # self.email = data['email']
    # self.pay_type = data['pay_type']

    # populate_page_with DEFAULT_DATA.merge(data)

    populate_page_with data_for(:form_page, data)


  end


end