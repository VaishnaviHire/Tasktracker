defmodule TasktrackerWeb.PageController do
  use TasktrackerWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

   def test(conn, _params) do
    render conn, "user.html"
  end

end
