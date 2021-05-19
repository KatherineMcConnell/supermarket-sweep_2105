require 'rspec'
require './lib/product'

RSpec.describe Product do
#Iteration 1
  it 'exists' do
    product = Product.new(:paper, 'toilet paper', 3.70, '10')

  expect(product).to be_an_instance_of(Product)
  end

  it 'has attributes' do
    product = Product.new(:paper, 'toilet paper', 3.70, '10')

  expect(product.category).to eq(:paper)
  expect(product.name).to eq('toilet paper')
  expect(product.unit_price).to eq(3.70)
  expect(product.quantity).to eq(10)
  end

  it 'can calculate total price' do
    product = Product.new(:paper, 'toilet paper', 3.70, '10')

    expect(product.total_price).to eq(37.0)
  end

  it 'can be hoarded' do
    product = Product.new(:paper, 'toilet paper', 3.70, '10')

    expect(product.is_hoarded?).to eq(false)
    product.hoard
    expect(product.is_hoarded?).to eq(true)
  end
end
