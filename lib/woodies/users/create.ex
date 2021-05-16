defmodule Woodies.Users.Create do
  alias Ecto.Multi
  alias Woodies.{User, Photo, Repo}
  import Woodies, only: [preload_user_data: 2]

  def call(params) do
    Multi.new()
    |> Multi.insert(
      :create_user,
      User.changeset(params)
    )
    |> Multi.run(:create_photo, fn repo, %{create_user: user} ->
      insert_photo(repo, params, user)
    end)
    |> preload_user_data(:create_user)
    |> run_transaction
  end

  defp insert_photo(repo, params, user) do
    case params["photo"] do
      nil ->
        {:error, "photo can't be blank"}

      %{"url" => url} ->
        url
        |> photo_changeset(user.id)
        |> repo.insert()

      _any_value ->
        {:error, %{photo: %{url: ["can't be blank"]}}}
    end
  end

  defp photo_changeset(url, user_id) do
    %{
      url: url,
      user_id: user_id
    }
    |> Photo.changeset()
  end

  defp run_transaction(multi) do
    case Repo.transaction(multi) do
      {:error, _operation, reason, _changes} -> {:error, reason}
      {:ok, %{preload_data: user}} -> {:ok, user}
    end
  end
end
