defmodule Giga.Repo do
  use Ecto.Repo,
    otp_app: :giga,
    adapter: Ecto.Adapters.Postgres
end
