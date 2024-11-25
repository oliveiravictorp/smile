defmodule Smile.Users.ListUser do
  alias Smile.{User, Repo}

  def call() do
    case Repo.all(User) do
      [] -> {:error, "Users not found"}
      users -> {:ok, users}
    end
  end
end
