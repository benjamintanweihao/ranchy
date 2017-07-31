defmodule Ranchy.Server do

  alias Ranchy.Handler

  def start do
    {:ok, _} = :ranch.start_listener(:foo_protocol,
      10,
      :ranch_tcp,
      [port: 5555],
      Handler,
      []
    )
  end

  def stop do
    :ranch.stop_listener(:foo_protocol)
  end

end
