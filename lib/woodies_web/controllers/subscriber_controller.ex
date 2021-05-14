defmodule WoodiesWeb.SubscriberController do
  use WoodiesWeb, :controller
  alias Woodies.{Subscriber}
  action_fallback WoodiesWeb.FallbackController

  def index(conn, _params) do
    with {:ok, subscribers} <- Woodies.get_all_subscribers() do
      conn
      |> put_status(:ok)
      |> render("index.json", subscribers: subscribers)
    end
  end

  def create(conn, params) do
    with {:ok, %Subscriber{} = subscriber} <- Woodies.subscribe_on_newsletter(params) do
      conn
      |> put_status(:created)
      |> render("create.json", subscriber: subscriber)
    end
  end
end
