defmodule Woodies.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecto.Changeset

  alias Woodies.{Photo}

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:name, :surname, :email, :password]

  schema "users" do
    field :name, :string
    field :surname, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    has_one :photo, Photo
    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_format(:email, ~r/(\w+)@([\w.]+)/)
    |> validate_length(:password, min: 6, max: 14)
    |> unique_constraint([:email])
    |> put_password_hash
  end

  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    changeset |> change(Pbkdf2.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
