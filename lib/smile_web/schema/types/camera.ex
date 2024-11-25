defmodule SmileWeb.Schema.Types.Camera do
  use Absinthe.Schema.Notation

  object :camera do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :brand, non_null(:string)
    field :active, non_null(:boolean)
    field :user_id, non_null(:id)
  end

  input_object :create_camera_input do
    field :name, non_null(:string)
    field :brand, non_null(:string)
    field :active, non_null(:boolean)
    field :user_id, non_null(:id)
  end
end
