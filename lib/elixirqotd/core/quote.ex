defmodule Elixirqotd.Core.Quote do
  use Ecto.Schema
  import Ecto.Changeset
  alias Elixirqotd.Core.Quote


  schema "quotes" do
    field :author, :string
    field :content, :string

    timestamps()
  end

  @doc false
  def changeset(%Quote{} = quote, attrs) do
    quote
    |> cast(attrs, [:author, :content])
    |> validate_required([:author, :content])
  end
end
