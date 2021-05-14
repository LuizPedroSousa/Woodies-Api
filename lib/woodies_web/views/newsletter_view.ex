defmodule WoodiesWeb.NewsletterView do
  alias Woodies.Newsletter

  def render("index.json", %{subscribers: subscribers}) do
    %{
      ok: "Show list of subscribers on newsletter with successfully",
      subscribers: format_subscribers(subscribers)
    }
  end

  def render("subscribe.json", %{
        newsletter: %Newsletter{
          id: id,
          email: email,
          inserted_at: inserted_at
        }
      }) do
    %{
      ok: "Subscribe on newsletter with successfully",
      newsletter: %{
        id: id,
        email: email,
        inserted_at: inserted_at
      }
    }
  end

  defp format_subscribers(subscribers) do
    subscribers
    |> Enum.map(fn %Newsletter{id: id, email: email, inserted_at: inserted_at} ->
      %{id: id, email: email, inserted_at: inserted_at}
    end)
  end
end
