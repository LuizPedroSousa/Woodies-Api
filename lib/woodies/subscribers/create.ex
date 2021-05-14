defmodule Woodies.Subscribers.Create do
  alias Woodies.{Repo, Subscriber}

  def call(params) do
    params
    |> Subscriber.changeset()
    |> Repo.insert()
  end
end
