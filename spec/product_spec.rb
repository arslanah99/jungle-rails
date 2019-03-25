require "rails_helper"

RSpec.describe Product, type: :model do
    describe 'Validations' do

        it "Should be true because everything is added" do
        category = Category.new name:  "Coolguy69";
        product = Product.new(name: 'Coolguy69', price: 69, quantity: 69, category:category)
        expect(product.save).to eql true
        end

        it "validators return proper error message if name is missing" do
            category = Category.new name:  "Coolguy69";
            product = Product.new(name: nil, price: 69, quantity: 69, category:category)
            product.save
            expect(product.errors.full_messages).to include
        end
        it "validators return proper error message if price is missing" do
            category = Category.new name:  "Coolguy69";
            product = Product.new(name: "Coolguy69", price: nil, quantity: 69, category:category)
            product.save
            expect(product.errors.full_messages).to include
        end
        it "validators return proper error message if quantity is missing" do
            category = Category.new name:  "Coolguy69";
            product = Product.new(name: "Coolguy69", price: 69, quantity: nil, category:category)
            product.save
            expect(product.errors.full_messages).to include
        end
        it "validators return proper error message if category is missing" do
            category = Category.new name:  "Coolguy69";
            product = Product.new(name: "Coolguy69", price: 69, quantity: 69, category:nil)
            product.save
            expect(product.errors.full_messages).to include
        end


    end
end