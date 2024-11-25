defmodule SmileWeb.Auth.Guardian do
  use Guardian, otp_app: :smile

  @doc """
  Define o identificador no token. Como não há usuários, podemos usar um valor fixo.
  """
  def subject_for_token(_resource, _claims), do: {:ok, "authorized_client"}

  @doc """
  Recupera o recurso a partir das claims. Retorna um valor genérico.
  """
  def resource_from_claims(_claims), do: {:ok, "authorized_client"}
end
