defmodule Rexmakesurworld.Schema do
  use Absinthe.Schema
  alias Rexmakesurworld.Resolvers
  import_types __MODULE__.ProjectTypes

  query do
    @desc "Lijst van projecten"
    field :projects, list_of(:project) do
      resolve &Resolvers.Project.projects/3
    end
  end

  mutation do

    field :create_project, :project do
      arg :input, non_null(:project_input)
      resolve &Resolvers.Project.create_project/3
    end

  end

end
