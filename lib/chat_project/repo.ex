defmodule ChatProject.Repo do
  use Ecto.Repo,
    otp_app: :chat_project,
    adapter: Ecto.Adapters.Postgres
end
