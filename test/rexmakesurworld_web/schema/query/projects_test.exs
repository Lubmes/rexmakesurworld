defmodule Rexmakesurworld.Schema.Query.ProjectsTest do
  use RexmakesurworldWeb.ConnCase, async: true

  setup do
    Rexmakesurworld.Seeds.run()
  end

  @query """
  {
    projects {
      title
    }
  }
  """
  test "projects field retouneerd projects" do
    conn = build_conn()
    conn = get conn, "/api", query: @query
    assert json_response(conn, 200) == %{
      "data" => %{
        "projects" => [
          %{"title" => "Een concreet begin"},
          %{"title" => "Grof conceptueel spuiwerk voor bewoning."},
          %{"title" => "Grof conceptueel spuiwerk voor een werkplaats."},
          %{"title" => "Vrije landschapsconcepten"},
        ]
      }
    }
  end

end
