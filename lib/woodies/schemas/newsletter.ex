defmodule Woodies.Newsletter do
  use Ecto.Schema
  import Ecto.Changeset
  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:email]

  schema "newsletter" do
    field :email, :string

    timestamps()
  end


  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_format(:email, ~r/(\w+)@([\w.]+)/)
    |> unique_constraint([:email])
  end
end
