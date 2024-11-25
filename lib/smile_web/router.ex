defmodule SmileWeb.Router do
  use SmileWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authenticated do
    plug SmileWeb.Plugs.Authenticate
  end

  scope "/api" do
    pipe_through [:api, :authenticated]

    forward "/graphql", Absinthe.Plug, schema: SmileWeb.Schema
  end

  if Mix.env() == :dev do
    scope "/api" do
      forward "/graphiql", Absinthe.Plug.GraphiQL, schema: SmileWeb.Schema
    end
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:smile, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: SmileWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
