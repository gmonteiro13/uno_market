# Uno Market

## Descrição do projeto

Projeto da Turma 04 do TreinaDev. Consiste em criar um Marketplace para a compra e venda de produtos.

### Informações do projeto

* Versão do Ruby: 2.7.0p0

* Versão do Rails: 6.0.3.2

* Gems utilizadas: RSpec para a realização de testes,
Capybara para interagir com o RSpec e simular a interação do usuário com a aplicação
Simplecov para checar a cobertura de testes da aplicação.

* Configuração: Rodar, no terminal, o comando bundle install e rails db:seeds para popular o banco de dados (se for da sua preferência).

* Funcionalidades: Um usuário cadastrado cria uma conta e a empresa é retirada do seu domínio de email.
Com o login autorizado, o usuário pode navegar pelos produtos mas não pode cadastrar nem efetivar a compra de um, para isso ele precisa criar um perfil.

Ao criar um perfil, o usuário pode ver produtos cadastrados da mesma empresa, outros perfis de funcionários da mesma empresa e cadastrar/efetivar a compra de produtos.

O usuário também pode tirar dúvidas na página do produto.

* Status do projeto: Incompleto. O usuário deve ser capaz de adicionar produtos à sua lista de interesse
e conversar com outros usuários nas suas respectivas páginas de perfil. O usuário deve adicionar fotos ao produto. Atingir uma cobertura maior de testes (atualmente está em 95%), principalmente em relação aos produtos e suas funcionalidades dependendo do status.