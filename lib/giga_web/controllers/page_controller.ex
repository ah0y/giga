defmodule GigaWeb.PageController do
  use GigaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
