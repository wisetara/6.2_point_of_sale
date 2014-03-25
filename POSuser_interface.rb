require 'active_record'
require './lib/product.rb'

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
  puts "To Add a New Product to the POS: 'A'"
  puts "To View All Products, press 'P'"
  puts "To Return to the Main Menu, press 'M'"
  user_input = gets.chomp.downcase
    case user_input
    when 'a' then puts "Enter the Product Name:"
      product_name = gets.chomp.titlecase
      puts "Enter Product Price:"
      product_price = gets.chomp.to_f
      product_price = sprintf "%.2f", product_price
      Products.create({name: product_name, price: product_price})
      puts "You Have Entered '#{product_name}: $#{product_price}' into the POS"
      manager_menu
    when 'p' then view_products
    when 'm' then main_menu
    else
      main_menu
    end
end

def view_products
  Products.all.each {|product| puts "#{product.name}: $#{sprintf '%.2f', product.price}"}
  main_menu
end













title_menu
