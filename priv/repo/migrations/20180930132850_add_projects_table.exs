defmodule Rexmakesurworld.Repo.Migrations.AddProjectsTable do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :title,       :string
      add :description, :string
      timestamps
    end
  end
end
