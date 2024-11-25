defmodule Smile.Cameras.Create do
  alias Smile.{Camera, Repo}

  def call(params) do
    params
    |> Camera.changeset()
    |> Repo.insert()
  end
end
