defmodule Woodies do
  alias Woodies.Subscribers.Create, as: SubscriberCreate
  alias Woodies.Subscribers.GetAll, as: GetAllSubscribers
  alias Woodies.Users.Create, as: UserCreate
  alias Woodies.Users.Preload, as: UserPreload
  defdelegate subscribe_on_newsletter(params), to: SubscriberCreate, as: :call
  defdelegate get_all_subscribers(), to: GetAllSubscribers, as: :call
  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate preload_user_data(multi, key), to: UserPreload, as: :call
end
