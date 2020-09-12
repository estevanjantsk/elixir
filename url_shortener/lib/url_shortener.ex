defmodule URLShortener do
  use GenServer

  # Client API
  def start_link(opts \\ []), do: GenServer.start(__MODULE__, :ok, opts)
  def stop(pid), do: GenServer.cast(pid, :stop)
  def shorten(pid, url), do: GenServer.cast(pid, {:shorten, url})

  # GenServer callbacks
  def init(:ok), do: {:ok, %{}}

  def handle_cast(:stop, state) do
    {:stop, :normal, state}
  end

  def handle_call({:shorten, url}, _from, state) do
    short = md5(url)
    {:reply, short, Map.put(state, short, url)}
  end

  defp md5(url) do
    :crypto.hash(:md5, url)
    |> Base.encode16(case: :lower)
  end
end
