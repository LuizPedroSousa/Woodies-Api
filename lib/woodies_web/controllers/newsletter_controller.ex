defmodule WoodiesWeb.NewsletterController do
  use WoodiesWeb, :controller
  alias Woodies.{Newsletter}
  action_fallback WoodiesWeb.FallbackController

  def index(conn, _params) do
    with {:ok, subscribers} <- Woodies.get_all_subscribers() do
      conn
      |> put_status(:ok)
      |> render("index.json", subscribers: subscribers)
    end
  end

  def subscribe(conn, params) do
    with {:ok, %Newsletter{} = newsletter} <- Woodies.subscribe_newsletter(params) do
      conn
      |> put_status(:created)
      |> render("subscribe.json", newsletter: newsletter)
    end
  end
end
