defmodule Woodies.Newsletter.GetAll do
  alias Woodies.{Repo, Newsletter}

  def call() do
    case Repo.all(Newsletter) do
      [] -> {:error, "No subscribers yet"}
      subscribers -> {:ok, subscribers}
    end
  end
end
