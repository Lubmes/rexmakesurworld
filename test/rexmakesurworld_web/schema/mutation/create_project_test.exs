defmodule Rexmakesurworld.Schema.Mutation.CreateProjectTest do
  use RexmakesurworldWeb.ConnCase, async: true

  # Deze twee geven warnings. Misschien pas nodig bij inladen parents/children?
  # Als in: Category > MenuItem
  # alias Rexmakesurworld.{Repo, Project}
  # import Ecto.Query

  setup do
    Rexmakesurworld.Seeds.run()
  end

  @query """
  mutation ($project: ProjectInput!) {
    createProject(input: $project) {
      title
      description
    }
  }
  """
  test "createProject field creëert een project" do
    project = %{
      "title" => "Een nieuw project!",
      "description" => "Nodig, nuttig en sowieso mooi.",
    }
    conn = build_conn()
    conn = post conn, "/api",
      query: @query,
      variables: %{"project" => project}

    assert json_response(conn, 200) == %{
      "data" => %{
       "createProject" => %{
          "title" => project["title"],
          "description" => project["description"],
        }
      }
    }
  end


  test "creëren van een project met een bestaande titel faalt" do
    project = %{
      "title" => "Een concreet begin",
      "description" => "Whatever, ...",
    }
    conn = build_conn()
    conn = post conn, "/api",
      query: @query,
      variables: %{"project" => project}

    assert json_response(conn, 200) == %{
      "data" => %{"createProject" => nil},
      "errors" => [
        %{
          "locations" => [%{"column" => 0, "line" => 2}],
          "message" => "Could not create project",
          "path" => ["createProject"]
        }
      ]
    }
  end

end
