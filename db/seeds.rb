# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(email: 'biel@nintendo.com', password: '123456')
user_2 = User.create!(email: 'ana@nintendo.com', password: '123456')
user_3 = User.create!(email: 'diego@sony.com', password: '123456')
user_4 = User.create!(email: 'giulia@sony.com', password: '123456')

profile = Profile.create!(full_name: 'Gabriel Soares Cardoso Monteiro', social_name: 'Gabriel Monteiro', 
birth_date: '14/12/1994', job: 'Level Designer', department: 'Jogos', user: user)
profile_2 = Profile.create!(full_name: 'Ana Paula', social_name: 'Ana', 
birth_date: '26/03/1988', job: 'Art Director', department: 'Art', user: user_2)
profile_3 = Profile.create!(full_name: 'Diego Supervisor', social_name: 'Diego', 
birth_date: '26/03/1988', job: 'Manager', department: 'Production', user: user_3)
profile_4 = Profile.create!(full_name: 'Giulia Si Senor', social_name: 'Giulia', 
birth_date: '26/03/1988', job: 'Business Analyst', department: 'Compliance', user: user_4)

product = Product.create!(product_name: 'Donkey Kong Country 2', category: 'Jogos', 
description: 'Jogo de aventura do SNES', price: 100, user: user, status: :available)
product_2 = Product.create!(product_name: 'SNES', category: 'Consoles', 
description: 'Console muito usado no Brasil nos anos 90', price: 40, user: user, status: :available)
product_3 = Product.create!(product_name: 'Controle NES', category: 'Periféricos', 
description: 'Controle personalizado do NES', price: 40, user: user_2, status: :available)
product_4 = Product.create!(product_name: 'Camiseta Ares', category: 'Vestuários', 
description: 'Camiseta da franquia God of War', price: 10, user: user_3, status: :available)
product_5 = Product.create!(product_name: 'Chaveiro PS', category: 'Outros', 
description: 'Chaveiro com símbolo do PS1', price: 3, user: user_4, status: :available)


deal = Deal.create!(product: product, user_id: user_2.id)
deal_2 = Deal.create!(product: product_2, user_id: user_2.id, status: 'closed')
deal_3 = Deal.create!(product: product_3, user_id: user.id)
deal_4 = Deal.create!(product: product_4, user_id: user_4.id)