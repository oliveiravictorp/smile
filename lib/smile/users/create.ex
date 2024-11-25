defmodule Smile.Users.Create do
  alias Smile.{User, Repo}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
