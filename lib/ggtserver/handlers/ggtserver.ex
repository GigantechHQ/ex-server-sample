defmodule Ggtserver.Handlers.Ping do
    def init(req, opts) do
    body = %{"type" => "pong"} |> Poison.encode!()
    req2 = :cowboy_req.reply 200, %{"content-type" => "application/json"}, body, req
    {:ok, req2, opts}
    end
end
