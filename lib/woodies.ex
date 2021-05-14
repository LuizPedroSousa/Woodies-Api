defmodule Woodies do
  alias Woodies.Subscribers.Create, as: SubscriberCreate
  alias Woodies.Subscribers.GetAll, as: GetAllSubscribers
  defdelegate subscribe_on_newsletter(params), to: SubscriberCreate, as: :call
  defdelegate get_all_subscribers(), to: GetAllSubscribers, as: :call
end
