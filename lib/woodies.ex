defmodule Woodies do
  alias Woodies.Newsletter.Subscribe, as: NewsletterSubscribe
  alias Woodies.Newsletter.GetAll, as: GetAllSubscribers
  defdelegate subscribe_newsletter(params), to: NewsletterSubscribe, as: :call
  defdelegate get_all_subscribers(), to: GetAllSubscribers, as: :call
end
