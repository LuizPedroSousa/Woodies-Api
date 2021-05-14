defmodule Woodies.Repo do
  use Ecto.Repo,
    otp_app: :woodies,
    adapter: Ecto.Adapters.Postgres
end
