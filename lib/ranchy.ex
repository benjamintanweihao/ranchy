defmodule Ranchy do

  def tcp do
    Ranchy.Server.start

    Ranchy.Client.start

    :timer.sleep(500)

    Ranchy.Server.stop
  end

end
