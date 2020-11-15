defmodule GigaWeb.PageControllerTest do
  use GigaWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Hot Reloads!"
  end
end
