defmodule Smile.Cameras.ListUserCameras do
  import Ecto.Query, warn: false
  alias Smile.{Camera, Repo}

  def call(user) do
    query =
      from(c in Camera,
        where: c.user_id == ^user.id and c.active == true,
        order_by: c.name
      )

    case Repo.all(query) do
      [] -> {:error, "Users not found"}
      users -> {:ok, users}
    end
  end
end
