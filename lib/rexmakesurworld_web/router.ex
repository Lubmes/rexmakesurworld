defmodule RexmakesurworldWeb.Router do
  use RexmakesurworldWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    pipe_through :api

    forward "/api", Absinthe.Plug,
      schema: Rexmakesurworld.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: Rexmakesurworld.Schema,
      interface: :simple
  end

end
