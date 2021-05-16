defmodule WoodiesWeb.UserView do
  alias Woodies.{User, Photo}

  def render("create.json", user) do
    %{
      ok: "User created with successfully",
      user: get_credentials(user)
    }
  end

  defp get_credentials(%{
         user: %User{
           id: id,
           name: name,
           surname: surname,
           email: email,
           photo: %Photo{
             id: photo_id,
             url: url,
             user_id: user_id,
             inserted_at: photo_inserted_at
           },
           inserted_at: inserted_at
         }
       }) do
    %{
      id: id,
      name: name,
      surname: surname,
      email: email,
      photo: %{
        id: photo_id,
        url: url,
        user_id: user_id,
        inserted_at: photo_inserted_at
      },
      inserted_at: inserted_at
    }
  end
end
