require_relative "../views/customers_view"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def list
    # ask the repository for all the customers
    customers = @customer_repository.all
    # ask the view to display the customers
    @customers_view.display(customers)
  end

  def add
    # ask the view to ask user the name of the customer and store it
    name = @customers_view.ask_for("name")
    # ask user the price of the customer and store it
    address = @customers_view.ask_for("address")
    # create a new customer instance
    customer = Customer.new(name: name, address: address)
    # give the instance to the repository to save
    @customer_repository.create(customer)
  end
end
