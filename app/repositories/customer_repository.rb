require 'csv'
require_relative '../models/customer'

class CustomerRepository
  # attr_reader :customers
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @customers = []
    @next_id = 1
    load_csv if File.exists?(@csv_file_path)
  end

  def all
    @customers
  end

  def create(customer)
    customer.id = @next_id
    @customers << customer
    @next_id += 1
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |attributes|
      # p attributes
      attributes[:id] = attributes[:id].to_i
      # p attributes 
      @customers << Customer.new(attributes)
    end
    @next_id = @customers.empty? ? @next_id : @customers.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ['id', 'name', 'address']
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end
