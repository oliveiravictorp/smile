defmodule SmileWeb.Schema.Types.User do
  use Absinthe.Schema.Notation
  alias SmileWeb.Resolvers

  object :user do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :active, non_null(:boolean)

    field :cameras, list_of(:camera) do
      arg(:filter, :string)
      arg(:order, :string, default_value: "asc")

      resolve &Resolvers.Camera.list_user_cameras/3
    end
  end
end
