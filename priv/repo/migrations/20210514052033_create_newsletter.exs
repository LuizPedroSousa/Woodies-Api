defmodule Woodies.Repo.Migrations.CreateNewsletter do
  use Ecto.Migration

  def change do
    create table :newsletter do
      add :email, :string

      timestamps()
    end

    create unique_index(:newsletter, [:email])
  end
end
