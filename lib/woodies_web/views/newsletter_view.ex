defmodule WoodiesWeb.NewsletterView do
  alias Woodies.Newsletter

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
end
