defmodule Woodies.Subscribers.GetAll do
  alias Woodies.{Repo, Subscriber}

  def call() do
    case Repo.all(Subscriber) do
      [] -> {:error, "No subscribers yet"}
      subscribers -> {:ok, subscribers}
    end
  end
end
