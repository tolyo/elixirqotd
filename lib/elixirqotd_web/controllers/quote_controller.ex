defmodule ElixirqotdWeb.QuoteController do
  use ElixirqotdWeb, :controller
  import Phoenix.Controller

  def index(conn, _params) do
    html conn, "<h1>Real Programmers do not eat Quiche</h1>"
  end

  def show(conn, _params) do
    render conn, "show.html", randomQuote()
  end

  def randomQuote() do
    static_author = "Anonymous"
    static_content = "Real Programmers do not eat Quiche"
    [author: static_author, quote: static_content]
  end

end
