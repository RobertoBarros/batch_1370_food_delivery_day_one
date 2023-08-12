require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def add
    # Mandar a view perguntar o nome da customer
    name = @view.ask_name

    # Mandar a view perguntar o endereço da customer
    address = @view.ask_address

    # Instanciar um novo customer
    new_customer = Customer.new(name:, address:)

    # Mandar o customer_repository criar a customer
    @customer_repository.create(new_customer)

  end

  def list
    # pegar todos os customers do repositório
    customers = @customer_repository.all

    # Mandar a view listar os customers
    @view.list(customers)
  end
end
