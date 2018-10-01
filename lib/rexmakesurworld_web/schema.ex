defmodule Rexmakesurworld.Schema do
  use Absinthe.Schema

  query do
    # ignore for now.
  end

  object :project do
    field :id,          :id
    field :title,       :string
    field :description, :string
  end

end
