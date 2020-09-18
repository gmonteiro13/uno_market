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

    it 'product name has maximum 50 characters' do
      user_2 = User.create!(email: 'tiago@nintendo.com', password: '654321')
      product = Product.new(product_name: 'Lorem ipsum dolor sit amet, consectetuer adipiscin elit.', category: 'Jogos', description: 'Jogo de aventura do SNES', price: 100, user: user_2, status: :available)
      
      product.valid?

      expect(product.errors[:product_name]).to include('é muito longo (máximo: 50 caracteres)')
    end

    it 'description has maximum 200 characters' do
      user_2 = User.create!(email: 'tiago@nintendo.com', password: '654321')
      product = Product.new(product_name: 'Donkey Kong Country 2', category: 'Jogos', description: 'Lorem ipsum dolor sit amet, aconsectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec qu', price: 100, user: user_2, status: :available)
      
      product.valid?
      
      expect(product.errors[:description]).to include('é muito longo (máximo: 200 caracteres)')
    end
  end
end