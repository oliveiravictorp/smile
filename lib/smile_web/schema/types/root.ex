defmodule SmileWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation
  alias SmileWeb.Resolvers

  import_types SmileWeb.Schema.Types.Camera
  import_types SmileWeb.Schema.Types.User

  object :root_query do
    field :list_camera, list_of(:camera) do
      arg(:filter, :string)
      arg(:order, :string, default_value: "asc")
      arg(:limit, :integer, default_value: 1000)
      arg(:offset, :integer, default_value: 0)

      resolve &Resolvers.Camera.list/2
    end

    field :get_camera, type: :camera do
      arg :id, non_null(:id)

      resolve &Resolvers.Camera.get/2
    end
  end

  object :root_mutation do
    field :notify_hikvision_users, list_of(:user) do
      resolve(&Resolvers.User.notify_hikvision_users/2)
    end

    field :create_camera, type: :camera do
      arg :input, non_null(:create_camera_input)

      resolve &Resolvers.Camera.create/2
    end
  end
end
