require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validation' do
    it 'attributes cannot be blank' do
      product = Product.new

      product.valid?

      expect(product.errors[:product_name]).to include('não pode ficar em branco')
      expect(product.errors[:category]).to include('não pode ficar em branco')
      expect(product.errors[:description]).to include('não pode ficar em branco')
      expect(product.errors[:price]).to include('não pode ficar em branco')
    end

    it 'price must be greater than or equal to 1' do
      product = Product.new
      product.valid?

      expect(product.errors[:price]).to include('Preço precisa ser maior ou igual a R$ 1,00')
    end
  end
end
