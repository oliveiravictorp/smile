defmodule SmileWeb.Resolvers.Camera do
  alias Smile.Cameras

  # Queries
  def list(%{filter: filter, order: order, limit: limit, offset: offset}, _context) do
    Cameras.List.call(filter, order, limit, offset)
  end

  def get(%{id: camera_id}, _context), do: Cameras.Get.call(camera_id)

  # Mutations
  def create(%{input: params}, _context), do: Cameras.Create.call(params)
end
