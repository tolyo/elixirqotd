defmodule ElixirqotdWeb.QuoteController do
  use ElixirqotdWeb, :controller

  def index(conn, _params) do
    html conn, "<h1>Real Programmers do not eat Quiche</h1>"
  end

end
