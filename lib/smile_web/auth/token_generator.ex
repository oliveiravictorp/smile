defmodule SmileWeb.Auth.TokenGenerator do
  alias SmileWeb.Auth.Guardian

  @doc """
  Gera um token JWT válido com as claims padrões.
  """
  def generate_token do
    {:ok, token, _claims} = Guardian.encode_and_sign("authorized_client")
    token
  end
end
