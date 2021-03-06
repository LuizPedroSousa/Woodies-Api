defmodule WoodiesWeb.Router do
  use WoodiesWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Subscribe newsletter
  scope "/", WoodiesWeb do
    pipe_through :api
    get "/newsletter/subscribers", SubscriberController, :index
    post "/newsletter/subscribe", SubscriberController, :create
  end

  # User
  scope "/", WoodiesWeb do
    pipe_through :api
    post "/user/create", UserController, :create
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: WoodiesWeb.Telemetry
    end
  end
end
