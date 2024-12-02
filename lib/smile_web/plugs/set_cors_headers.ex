defmodule SmileWeb.Plugs.SetCorsHeaders do
  import Plug.Conn

  # Padrão para ambientes sem configuração explícita
  @default_origins ["*"]

  def init(opts), do: opts

  def call(conn, _opts) do
    allowed_origins =
      Application.get_env(:smile, __MODULE__, [])[:allowed_origins] || @default_origins

    origin = get_req_header(conn, "origin") |> List.first()

    if origin && origin in allowed_origins do
      conn
      |> put_resp_header("access-control-allow-origin", origin)
      |> put_resp_header("access-control-allow-methods", "GET, POST, OPTIONS")
      |> put_resp_header("access-control-allow-headers", "Accept, Authorization, Content-Type")
      |> put_resp_header("access-control-max-age", "86400")
    else
      conn
    end
  end
end
