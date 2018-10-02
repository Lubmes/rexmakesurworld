defmodule Rexmakesurworld.Project do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rexmakesurworld.Project

  schema "projects" do
    field :description, :string
    field :title, :string, null: false
    timestamps()
  end

  @doc false
  def changeset(%Project{} = project, attrs) do
    project
    |> cast(attrs, [:title, :description])
    |> validate_required([:title])
  end
end
