defmodule WoodiesWeb.SubscriberView do
  alias Woodies.Subscriber

  def render("index.json", %{subscribers: subscribers}) do
    %{
      ok: "Show list of subscribers on newsletter with successfully",
      subscribers: format_subscribers(subscribers)
    }
  end

  def render("create.json", %{
        subscriber: %Subscriber{
          id: id,
          email: email,
          inserted_at: inserted_at
        }
      }) do
    %{
      ok: "Subscribed on newsletter with successfully",
      subscriber: %{
        id: id,
        email: email,
        inserted_at: inserted_at
      }
    }
  end

  defp format_subscribers(subscribers) do
    subscribers
    |> Enum.map(fn %Subscriber{id: id, email: email, inserted_at: inserted_at} ->
      %{id: id, email: email, inserted_at: inserted_at}
    end)
  end
end
