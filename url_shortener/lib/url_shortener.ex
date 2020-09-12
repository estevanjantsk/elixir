defmodule URLShortener do
  def start do
    spawn(__MODULE__, :loop, [%{}])
  end

  def loop(state) do
    receive do
      {:stop, caller} ->
        send(caller, "Shutting down.")

      {:shorten, url, caller} ->
        url_md5 = md5(url)
        new_state = Map.put(state, url_md5, url)
        send(caller, url_md5)
        loop(new_state)

      {:get, md5, caller} ->
        send(caller, Map.fetch(state, md5))
        loop(state)

      :flush ->
        loop(%{})

      _ ->
        loop(state)
    end
  end

  defp md5(url) do
    :crypto.hash(:md5, url)
    |> Base.encode16(case: :lower)
  end
end
