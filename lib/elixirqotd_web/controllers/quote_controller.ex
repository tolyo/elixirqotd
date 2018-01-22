defmodule ElixirqotdWeb.QuoteController do
  use ElixirqotdWeb, :controller

  alias Elixirqotd.Core
  alias Elixirqotd.Core.Quote

  import Phoenix.Controller
  import Enum

  def staticQuote() do
    static_author = "Anonymous"
    static_content = "Real Programmers do not eat Quiche"
    [quote: %{author: static_author, content: static_content}]
  end

  def dynamicQuote() do
    quotes = Core.list_quotes()
    size = length(quotes) - 1
    random_number = :rand.uniform(size)
    Enum.at(quotes, random_number)
  end

  def static(conn, _params) do
    html conn, "<h1>Real Programmers do not eat Quiche</h1>"
  end

  def random(conn, _params) do
    render(conn, "random.html", quote: dynamicQuote())
  end

  def randomAjax(conn, _params) do
    render(put_layout(conn, false), "random.html", quote: dynamicQuote())
  end

  def staticview(conn, _params) do
    render conn, "static.html", staticQuote()
  end

  def index(conn, _params) do
    quotes = Core.list_quotes()
    render(conn, "index.html", quotes: quotes)
  end

  def new(conn, _params) do
    changeset = Core.change_quote(%Quote{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"quote" => quote_params}) do
    case Core.create_quote(quote_params) do
      {:ok, quote} ->
        conn
        |> put_flash(:info, "Quote created successfully.")
        |> redirect(to: quote_path(conn, :show, quote))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    quote = Core.get_quote!(id)
    render(conn, "show.html", quote: quote)
  end

  def edit(conn, %{"id" => id}) do
    quote = Core.get_quote!(id)
    changeset = Core.change_quote(quote)
    render(conn, "edit.html", quote: quote, changeset: changeset)
  end

  def update(conn, %{"id" => id, "quote" => quote_params}) do
    quote = Core.get_quote!(id)

    case Core.update_quote(quote, quote_params) do
      {:ok, quote} ->
        conn
        |> put_flash(:info, "Quote updated successfully.")
        |> redirect(to: quote_path(conn, :show, quote))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", quote: quote, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    quote = Core.get_quote!(id)
    {:ok, _quote} = Core.delete_quote(quote)

    conn
    |> put_flash(:info, "Quote deleted successfully.")
    |> redirect(to: quote_path(conn, :index))
  end
end
