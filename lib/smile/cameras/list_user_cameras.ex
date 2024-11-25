defmodule Smile.Cameras.ListUserCameras do
  import Ecto.Query, warn: false
  alias Smile.{Camera, Repo, Cameras.List}

  def call(user, filter, order) do
    query =
      from(c in Camera,
        where: c.user_id == ^user.id and c.active == true
      )
      |> List.filter_by_name(filter)
      |> List.order_by_name(order)

    case Repo.all(query) do
      [] -> {:error, "Users not found"}
      users -> {:ok, users}
    end
  end
end
