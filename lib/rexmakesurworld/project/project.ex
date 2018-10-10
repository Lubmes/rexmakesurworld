defmodule Rexmakesurworld.Project do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias Rexmakesurworld.Repo
  alias Rexmakesurworld.Project

  schema "projects" do
    field :description, :string
    field :title, :string, null: false
    timestamps()
  end

  def list_projects do
    Repo.all(Project)
  end

  @doc false
  def changeset(%Project{} = project, attrs) do
    project
    |> cast(attrs, [:title, :description])
    |> validate_required([:title])
  end

  def create_project(attrs \\ %{}) do
    %Project{}
    |> Project.changeset(attrs)
    |> Repo.insert()
  end
end
