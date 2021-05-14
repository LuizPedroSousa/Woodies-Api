defmodule Woodies.Repo.Migrations.CreateNewsletterSubscriber do
  use Ecto.Migration

  def change do
    create table :newsletter_subscribers do
      add :email, :string

      timestamps()
    end

    create unique_index(:newsletter_subscribers, [:email])
  end
end
