defmodule SmileWeb.Resolvers.User do
  alias Smile.Users

  def list_user(_params, _context) do
    Smile.Users.ListUser.call()
  end

  def notify_hikvision_users(_params, _context) do
    case Users.GetHikvision.call() do
      [] ->
        {:error, "Users nor found"}

      users ->
        # Simula o envio de e-mail
        Enum.each(users, fn user ->
          IO.puts("Notificando usuário #{user.name} (ID: #{user.id})")
        end)

        {:ok, users}
    end
  end
end
