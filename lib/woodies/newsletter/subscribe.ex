defmodule Woodies.Newsletter.Subscribe do
  alias Woodies.{Repo, Newsletter}

  def call(params) do
    params
    |> Newsletter.changeset()
    |> Repo.insert()
  end
end
