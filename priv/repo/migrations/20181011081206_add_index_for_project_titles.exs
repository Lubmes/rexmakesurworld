defmodule Rexmakesurworld.Repo.Migrations.AddIndexForProjectTitles do
  use Ecto.Migration

  def change do
    create unique_index(:projects, [:title])
  end

end
