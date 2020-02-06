defmodule Dat.Hypercore.Feed do
  @max_feed_size 8 * 1024 * 1024
  @max_message_size 10 * 1024 * 1024

  defstruct bitfield: '',
            tree: '',
            signatures: [],
            key: '',
            secret_key: '',
            config: %Dat.Hypercore.Config{}
end

defmodule Dat.Hypercore.Config do
  @feed_size 8 * 1024 * 1024
  @message_size 10 * 1024 * 1024

  # "json" or "utf-8"
  defstruct value_encoding: "binary"
end

defmodule RaKv.Machine do
  @behaviour :ra_machine

  @impl :ra_machine
  def init(_args) do
    %{}
  end

  @impl :ra_machine
  def apply(_meta, {:new}, state) do
    feed = "hypercore"
    key = feed
    {Map.put(state, key, feed), feed}
  end

  @impl :ra_machine
  def apply(
        _meta,
        {:set, key, feed = %Dat.Hypercore.Feed{}, _index,
         _config = %Dat.Hypercore.Config{}},
        state
      )
      when is_binary(key) and is_binary(feed) do
    {Map.put(state, key, feed), :inserted}
  end

  @impl :ra_machine
  def apply(
        _meta,
        {:set, _key, _feed, _index, _config},
        state
      ) do
    {state, :error}
  end

  @impl :ra_machine
  def apply(_meta, {:append, key, block}, state) when is_binary(block) do
    feed = Map.get(state, key, nil)
    {Map.put(state, key, feed + block), :inserted}
  end

  @impl :ra_machine
  def apply(_meta, {:append, _key, _block}, state) do
    {state, :error}
  end

  @impl :ra_machine
  def apply(_meta, {:get, key}, state) do
    reply = Map.get(state, key, nil)
    {state, reply}
  end
end
