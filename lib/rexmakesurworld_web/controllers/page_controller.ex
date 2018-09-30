defmodule RexmakesurworldWeb.PageController do
  use RexmakesurworldWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
