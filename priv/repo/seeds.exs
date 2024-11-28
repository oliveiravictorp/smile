import Ecto.Query, warn: false
require Faker

alias Smile.{Repo, User, Camera}

brands = ["Intelbras", "Hikvision", "Giga", "Vivotek"]

# Gerar os timestamps no formato correto
now = DateTime.utc_now() |> DateTime.truncate(:second)

# Gerar os usuários
users =
  1..1_000
  |> Enum.map(fn _ ->
    %{
      name: Faker.Person.name(),
      inserted_at: now,
      updated_at: now
    }
  end)

Repo.insert_all(User, users)

# Obter os IDs dos usuários
user_ids = Repo.all(from(u in User, select: u.id))

# Gerar as câmeras
cameras =
  Enum.flat_map(user_ids, fn user_id ->
    1..50
    |> Enum.map(fn _ ->
      %{
        name: Faker.Commerce.product_name(),
        brand: Enum.random(brands),
        active: Enum.random([true, false]),
        user_id: user_id,
        inserted_at: now,
        updated_at: now
      }
    end)
  end)

# Número de câmeras por lote
chunk_size = 5_000

# Inserir as câmeras em lotes
cameras
|> Enum.chunk_every(chunk_size)
|> Enum.each(fn batch ->
  Repo.insert_all(Camera, batch)
end)
