defmodule Rexmakesurworld.Resolvers.Project do
  alias Rexmakesurworld.Project

  def projects(_, _, _) do
    {:ok, Project.list_projects}
  end

  def create_project(_, %{input: params}, _) do
    case Project.create_project(params) do
      {:error, _} ->
        {:error, "Could not create menu item"}
      {:ok, _} = success ->
        success
    end
  end

end
