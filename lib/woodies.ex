defmodule Woodies do
  alias Woodies.Newsletter.Subscribe, as: NewsletterSubscribe
  defdelegate subscribe_newsletter(params), to: NewsletterSubscribe, as: :call
end
