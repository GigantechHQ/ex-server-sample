defmodule Ggtserver do
  def start(_type, _args) do
  import Supervisor.Spec, warn: false
  children = []
  dispatch = :cowboy_router.compile([
      {:_, [
           {"/ping", Ggtserver.Handlers.Ping, []},
      ]}
    ])
    {:ok, _} = :cowboy.start_clear(:http,
                                   100,
                                   [{:port, 4000}],
                                   %{env: %{dispatch: dispatch}})
  opts = [strategy: :one_for_one, name: Ggtserver.Supervisor]
  Supervisor.start_link(children, opts)
  end
end
