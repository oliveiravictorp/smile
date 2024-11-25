defmodule SmileWeb.Plugs.Authenticate do
  import Plug.Conn
  require Logger
  alias SmileWeb.Auth.Guardian

  @doc """
  Inicializa o plug com opções.
  """
  def init(opts), do: opts

  @doc """
  Verifica a autorização via token JWT.
  """
  def call(conn, _opts) do
    case get_req_header(conn, "authorization") do
      ["Bearer " <> token] ->
        case Guardian.decode_and_verify(token) do
          {:ok, _claims} -> conn
          {:error, _reason} -> unauthorized_response(conn)
        end

      _ ->
        unauthorized_response(conn)
    end
  end

  defp unauthorized_response(conn) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(401, ~s({"error": "Unauthorized"}))
    |> halt()

    Logger.warning("Authentication failed for request: #{inspect(conn)}")
  end
end
