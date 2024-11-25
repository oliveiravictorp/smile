defmodule Smile.Camera do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:name, :brand, :active, :user_id]

  schema "cameras" do
    field :name, :string
    field :brand, :string
    field :active, :boolean, default: false
    belongs_to :user, Smile.User

    timestamps(type: :utc_datetime)
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
