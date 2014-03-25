require 'active_record'
require 'rspec'
require 'shoulda-matters'
require 'product'
ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSPEC.configure do |config|
  config.after (:each) do
    Products.all.each {|product| product.destroy}
