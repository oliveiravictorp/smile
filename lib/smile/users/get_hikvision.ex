defmodule Smile.Users.GetHikvision do
  @moduledoc """
  Retorna uma lista de usuários que possuem pelo menos uma câmera da marca Hikvision ativa.
  """
  import Ecto.Query, warn: false
  alias Smile.Repo
  alias Smile.User

  def call do
    from(u in User,
      join: c in assoc(u, :cameras),
      where:
        c.brand == "Hikvision" and
          c.active == true,
      distinct: u.id,
      preload: [:cameras]
    )
    |> Repo.all()
  end
end
