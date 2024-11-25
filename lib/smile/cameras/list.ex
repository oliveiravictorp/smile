defmodule Smile.Cameras.List do
  import Ecto.Query, warn: false
  require Logger
  alias Smile.{Camera, Repo}

  def call(filter, order, limit, offset) do
    query =
      Camera
      |> filter_by_name(filter)
      |> order_by_name(order)
      |> verify_limit(limit, offset)

    case Repo.all(query) do
      [] -> {:error, "Cameras not found"}
      cameras -> {:ok, cameras}
    end
  end

  # defp verify_limit(query, nil, _offset), do: query

  defp verify_limit(query, limit, offset) do
    query
    |> limit(^limit)
    |> offset(^offset)
  end

  defp filter_by_name(query, nil), do: query

  defp filter_by_name(query, filter) do
    from c in query, where: ilike(c.name, ^"%#{filter}%")
  end

  defp order_by_name(query, order) when order in ["asc", "desc"] do
    from c in query, order_by: [{^String.to_atom(order), :name}]
  end

  defp order_by_name(query, _invalid_order) do
    Logger.warning("Invalid order, default order: 'asc'")
    order_by_name(query, "asc")
  end
end
