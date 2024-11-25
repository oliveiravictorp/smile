# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Smile.Repo.insert!(%Smile.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Smile.{Repo, User, Camera}

brands = ["Intelbras", "Hikvision", "Giga", "Vivotek"]

1..1_000
|> Enum.each(fn _ ->
  user = Repo.insert!(%User{name: Faker.Name.name()})

  1..50
  |> Enum.each(fn _ ->
    Repo.insert!(%Camera{
      name: Faker.Commerce.product_name(),
      brand: Enum.random(brands),
      active: Enum.random([true, false]),
      user_id: user.id
    })
  end)
end)
