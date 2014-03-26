require 'active_record'
require './lib/product.rb'
require './lib/cashier.rb'
require './lib/purchase.rb'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)


def title_menu
  puts "\n\n\n"
  puts "Welcome to T&A Supah SupahMarket"
  main_menu
end


def main_menu
  puts "\n\n"
  puts "Store Managers - Press 'M'"
  puts "Cashiers - Press 'E' for Employee Access"
  puts "Customers, Thank You for Your Patronage! - Press 'C' to view the Customer Menu"
  puts "Press 'X' to leave our pretty awesome Grocery Experience"
  user_input = gets.chomp.downcase
  case user_input
  when 'm' then manager_menu
  when 'e' then employee_menu
  when 'c' then customer_menu
  when 'x' then puts "Sayonara\n\n\n"
  else
    main_menu
  end
end

def manager_menu
  puts "\n\n"
  puts "To Access the Products menu, press 'P'"
  puts "To Access to Employee Database, press 'D'"
  puts "To Return to the Main Menu, press 'M'"
  user_input = gets.chomp.downcase
  case user_input
  when 'p' then products_database
  when 'd' then employee_database
  when 'm' then main_menu
  else
    main_menu
  end
end

def products_database
puts "Your Options are as Follows:"
puts "Enter a New Product : Press 'A'"
puts "View All Products : Press 'V'"
puts "To Delete a Product from the Database, Press 'D'"
puts "Return to Manager Menu : Press 'M'"
user_input = gets.chomp.downcase
  case user_input
  when 'a' then add_products
  when 'v' then view_products
  when 'd' then delete_products
  when 'm' then manager_menu
  else main_menu
  end
end

def add_products
  puts "Enter the Product Name:"
    product_name = gets.chomp.titlecase
    puts "Enter Product Price:"
    product_price = gets.chomp.to_f
    product_price = sprintf "%.2f", product_price
    Products.create({name: product_name, price: product_price})
    puts "You Have Entered '#{product_name}: $#{product_price}' into the POS"
end

def view_products
  puts "\n\n"
  Products.all.each {|product| puts "#{product.name}: $#{sprintf '%.2f', product.price}"}
  products_database
  puts "\n\n"
end

def delete_products
  puts "\nHere are the Products in the Database:\n"
  Products.all.each {|product| puts "#{product.name}: $#{sprintf '%.2f', product.price}"}
  puts "\nType the Product you Desire to Delete:\n"
  item_to_delete = gets.chomp.titlecase
  located_item = Products.where({name: item_to_delete}).first
  located_item.destroy
  puts "You have chosen to no longer sell '#{item_to_delete}"
  products_database
end

def employee_database
  puts "\n\n"
  puts "To Add a New Employee, press 'N'"
  puts "To List all Employees, press 'L'"
  puts "To Edit an Employee, press 'E'"
  puts "To Return to the Main Menu, press 'M'"
  user_input = gets.chomp.downcase
  case user_input
  when 'n' then add_employee
  when 'l' then view_employees
  when 'e' then edit_employee
  when 'm' then main_menu
  else
    manager_menu
  end
end

def add_employee
  system('clear')
  puts "Enter the Employee Name:"
  name = gets.chomp.titlecase
  puts "Enter the Unique Employee Login Number"
  login = gets.chomp.to_i
  Cashier.create({name: name, login: login})
  puts "You Have Entered #{name}, LOGIN: #{login} into the POS"
  manager_menu
end

def view_employees
  puts "\n\n"
  Cashier.all.each {|cashier| puts "#{cashier.name}"}
  puts "\n\n"
  employee_database
end

def edit_employee
  puts "\n\nWelcome to the Employee Menu"
  puts "Your minions are as follows:"
  Cashier.all.each {|cashier| puts "#{cashier.name}"}
  puts "To Release an Employee from your Tyrannous Reign, Enter Their Name:"
  employee_to_delete = gets.chomp.titlecase
  locate_employee = Cashier.where({name: employee_to_delete}).first
  locate_employee.destroy
  puts "'#{employee_to_delete}' has been released with severance pay\n\n"
  puts "To return to Manager Menu press 'M' otherwise hit any key to return to Main Menu.\n\n"
  user_input = gets.chomp.downcase
    case user_input
    when 'm' then manager_menu
    else main_menu
    end
end

def employee_menu
  puts "To Ring Up a Purchase press 'P'"
  puts "To Return a Product press 'R'"
  puts "To Return to the Main Menu press 'M'"
  user_choice = gets.chomp.downcase
    case user_choice
    when 'p' then
      Purchase
    end

      def add_purchases
      puts "Enter your Cashier LogIn Number"
      cashier_login = gets.chomp.to_i
      current_cashier = Cashier.find_by({ :login => cashier_login })
      puts "You're a Great Cashier!\n\n\n"


      puts "These are the products available for sale:"
      Product.all.each_with_index {|product, index| puts "#{index+1}." "#{product.name}: $#{sprintf '%.2f', product.price}"}
      puts "Enter the index of the product you want to add to the purchase"
      user_input = gets.chomp

      current_cashier.purchases.create(product_id: user_input)




      cashier_login 9998
      cashier_id = Cashier.find_by(:id)#Cashiers.where({login: cashier_login}).first.id


      this_product = Product.create()

      Purchase.new({product_id: this_product.id, cashier_id: current_cashier.id})


      Purchase.create({cashier_id: cashier_id})


      puts "\n\nWhich product would you like to add to the purchase?"
      product_choice = gets.chomp.titlecase
      selected_product = Purchase.where({name: product_choice}).first
      puts "#{product.name} $#{sprintf '%.2f', product.price}"}
      transaction_array = []
      transaction_array << selected_product
end



    else
      main_menu
    end
end










title_menu
