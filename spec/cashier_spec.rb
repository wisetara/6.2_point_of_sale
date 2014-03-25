require 'spec_helper'

describe Cashier do
  it { should have_many :purchases }
  it { should have_many(:products).through(:purchases)}
end
