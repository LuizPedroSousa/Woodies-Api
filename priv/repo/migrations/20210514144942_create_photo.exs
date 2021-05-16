defmodule Woodies.Repo.Migrations.CreatePhoto do
  use Ecto.Migration

  def change do
    create table :photos do
      add :url, :string
      add :user_id, references(:users, type: :binary_id)

      timestamps()
    end
  end
end
