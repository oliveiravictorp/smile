![Smile](https://cdn.dribbble.com/users/336834/screenshots/3948692/smile_dribbble.png)

## Tecnologias utilizadas

- Elixir: https://hexdocs.pm/elixir
- Phoenix: https://hexdocs.pm/phoenix
- GraphQL: https://graphql.org/learn
- JWT: https://jwt.io/introduction

### Libs adicionais

- [Absinthe](https://hexdocs.pm/absinthe): Utilizada para dar suporte ao GraphQL no Elixir
- [Absinthe.Plug](https://hexdocs.pm/absinthe_plug): Utilizada para extender a lib Absinthe
- [Faker](https://hexdocs.pm/faker): Utilizado para preencher o banco com registros randômicos
- [Guardian](https://hexdocs.pm/guardian): Utilizado para construir a autenticação
- [ExDoc](https://hexdocs.pm/ex_doc): Utilizado para gerar a documentação do projeto

## Iniciando o projeto:

- Para instalar e configurar as dependencias: `mix setup`
- Para iniciar o servidor Phoenix: `mix phx.server`
- Para iniciar o servidor Phoenix dentro do IEx: `iex -S mix phx.server`
- Para acessar o projeto no navegador: [`localhost:4000/api/graphiql`](http://localhost:4000/api/graphiql)

## Queries e Mutations

[GraphiQL Workspace](https://drive.google.com/file/d/1VuILSDp_T6lyH_P9NIIovrdtYH3pHuoB/view?usp=sharing): Este JSON contem todas as queries e mutations desenvolvidas e pode ser importado na ferramenta gráfica GraphiQL

### Principais

- `{
  listUser {
    id
    name
    active
    cameras(filter: "Hat", order: "desc") {
      id
      name
      brand
      active
    }
  }
}`
- `mutation {
  notifyHikvisionUsers {
    id
    name
    active
  }
}`

## Detalhes da Implementação

Premissas, abordagens e decisões explicadas e documentadas.

### GraphQL

Aproveitei a oportunidade para aprender essa tecnologia, achei muito interessante e desafiador, mas com uma curva de aprendizado tranquila.

### Seed do banco de dados

Um fato interessante, é que essa foi a primeira vez que tive a necessidade de popular um banco de forma automática, como geralmente construo aplicações full-stack, sempre começo criando os formulários que irão popular o banco e peencho alguns registros para continuar o desenvolvimento, consequentemente essa necessidade nunca me ocorreu.

Gostei muito de ver, como é simples o script no Elixir, para chegar nesse fim.

### Autenticação / Autorização

A principio fiz de uma forma simples, utilizando a lib Guardian para gerar um Token JWT a partir de uma chave que está configurada no arquivo `config.exs`.

Se a aplicação que está consumindo utilizar o token correto no header Authorization estará autenticada e autorizada.

#### Gerar Token JWT

- Para rodar o projeto no terminal: `iex -S mix`
- Para gerar o token: `SmileWeb.Auth.TokenGenerator.generate_token()`

#### Adicionar header na requisição:

`"Authorization": "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJzbWlsZSIsImV4cCI6MTczNDkyMDUwMywiaWF0IjoxNzMyNTAxMzAzLCJpc3MiOiJzbWlsZSIsImp0aSI6ImM2NmJkNjhmLTM5ZWQtNGU3NC04OWExLWI0M2RkNzFmNDRmNiIsIm5iZiI6MTczMjUwMTMwMiwic3ViIjoiYXV0aG9yaXplZF9jbGllbnQiLCJ0eXAiOiJhY2Nlc3MifQ._12iN0TLYVo4vSE6xILbpKhY9l3Rm6Rb4BT5JECQBkHA1btuSPHdEnwcUzJdCLYAr001Fm3QuhwuU35n1AymgA"`

### Implementações futuras:

- Envio de email, coloquei somente um log para simular o envio de email para os diferentes usuários
- As queries que possuem o argumento filter só funcionam se ele estiver preenchido, infelizmente não cheguei a uma solução ainda
- Melhorar a documentação do projeto
- Melhorar os testes do projeto
