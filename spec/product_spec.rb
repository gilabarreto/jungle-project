require "rails_helper"

RSpec.describe Product, type: :model do
  describe "Validations" do
    it "adds a product if everything is available" do
      category = Category.create({ name: "category_test" })
      product = category.products.create({ name: "product_test", price: 1, quantity: 1 })
      expect(product).to be_valid
    end
    it "adds a product if name is available" do
      category = Category.create({ name: "category_test" })
      product = category.products.create({ name: nil, price_cents: 1, quantity: 1 })
      expect(product).to_not be_valid
    end
    it "adds a product if price is available" do
      category = Category.create({ name: "category_test" })
      product = category.products.create({ name: "product_test", price_cents: nil, quantity: 1 })
      expect(product).to_not be_valid
    end
    it "adds a product if quantity is available" do
      category = Category.create({ name: "category_test" })
      product = category.products.create({ name: "product_test", price_cents: 1, quantity: nil })
      expect(product).to_not be_valid
    end
    it "adds a product if category is available" do
      product = Product.create({ name: "product_test", price_cents: 1, quantity: 1, category: nil })
      expect(product).to_not be_valid
    end
  end
end
