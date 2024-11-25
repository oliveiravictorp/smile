defmodule Smile.User do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:name, :active]

  schema "users" do
    field :name, :string
    field :active, :boolean, default: true
    has_many :cameras, Smile.Camera

    timestamps(type: :utc_datetime)
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
