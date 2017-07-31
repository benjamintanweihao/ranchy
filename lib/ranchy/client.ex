defmodule Ranchy.Client do

  def start do
    {:ok, socket} = :gen_tcp.connect('localhost', 5555, [])
    :gen_tcp.send(socket, "OHAI")
  end
end
