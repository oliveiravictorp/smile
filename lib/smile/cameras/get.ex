defmodule Smile.Cameras.Get do
  alias Smile.{Camera, Repo}

  def call(id) do
    case Repo.get(Camera, id) do
      nil -> {:error, "Camera not found"}
      camera -> {:ok, camera}
    end
  end
end
