defmodule Ranchy.Handler do
  use GenServer

  require Logger

  @behaviour :ranch_protocol

  def start_link(ref, socket, transport, _opts) do
    pid = :proc_lib.spawn_link(__MODULE__, :init, [ref, socket, transport])
    {:ok, pid}
  end

  def init(ref, socket, transport) do
    :ok = :ranch.accept_ack(ref)
    :ok = transport.setopts(socket, [active: :once])

    state = %{socket: socket, transport: transport}

    :gen_server.enter_loop(__MODULE__, [], state)
  end

  def handle_info({:tcp, socket, data}, state = %{socket: socket, transport: transport}) do
    Logger.info ">>> #{inspect data}"
    :ok = transport.setopts(socket, [active: :once])

    {:noreply, state}
  end

end




