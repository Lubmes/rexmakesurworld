defmodule Rexmakesurworld.Schema do
  use Absinthe.Schema
  alias Rexmakesurworld.{Project, Repo}

  query do
    field :projects, list_of(:project) do
      resolve fn _, _, _ ->
        {:ok, Repo.all(Project)}
      end
    end
  end

  @desc "Project"
  object :project do
    field :id,          :id
    field :title,       :string
    field :description, :string
  end

end
