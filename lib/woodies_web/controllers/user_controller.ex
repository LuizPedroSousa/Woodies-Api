defmodule WoodiesWeb.UserController do
  use WoodiesWeb, :controller
  alias Woodies.{User}
  action_fallback WoodiesWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Woodies.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
