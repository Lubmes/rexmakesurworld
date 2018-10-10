defmodule Rexmakesurworld.Schema.ProjectTypes do
  use Absinthe.Schema.Notation

  alias Rexmakesurworld.Resolvers

  @desc "Project"
  object :project do
    field :id,          :id
    field :title,       :string
    field :description, :string
  end

  input_object :project_input do
    field :title, non_null(:string)
    field :description, :string
  end

end
