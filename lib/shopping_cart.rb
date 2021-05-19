class ShoppingCart
  attr_reader :name,
              :capacity,
              :products
  def initialize(name, capacity)
    @name = name
    @capacity = capacity.delete("items").to_i
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def details
    details_h = {}
    details_h[:name] = @name
    details_h[:capacity] = @capacity
    details_h
  end

  def total_number_of_products
    @products.sum {|product| product.quantity}
  end

  def is_full?
    total_number_of_products <= @capacity
  end

  def products_by_category(category)
    @products.find_all {|product| product.category == category}
  end

  def percentage_occupied
    (total_number_of_products.to_f/@capacity * 100).round(2)
  end

  def sorted_products_by_quantity
    sorted = @products.sort_by { |product| product.quantity}
    sorted.reverse
  end

  def product_breakdown
    breakdown_h = Hash.new{|hash,key| hash[key] = [] }
    @products.each do |product|
      breakdown_h[product.category] << product
    end
    breakdown_h
  end

end
