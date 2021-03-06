defmodule ChatProjectWeb.Plugs.AuthUser do
  import Plug.Conn
  import Phoenix.Controller
  alias ChatProjectWeb.Router.Helpers, as: Routes
  def init(_) do

  end


  def call(conn, _params) do
    if conn.assigns.signed_in? do
      IO.inspect(conn)
      conn
    else
      conn
      |> put_flash(:error, "You need to be signed in")
      |> redirect(to: Routes.session_path(conn, :new))
      |>halt()
    end
  end
end
