defmodule RaKv do
  @moduledoc """
  Documentation for RaKv.
  """

  def start(_args) do
    # the initial cluster members
    members = Enum.map([:a@localhost, :b@localhost, :c@localhost], fn node -> { :rakv, node } end)
    # an arbitrary cluster name
    clusterName = <<"ra_kv">>
    # the config passed to `init/1`, must be a `map`
    config = %{}
    # the machine configuration
    machine = {:module, RaKv.Machine, config}
    # ensure ra is started
    Application.ensure_all_started(:ra)
    # start a cluster instance running the `ra_kv` machine
    :ra.start_cluster(clusterName, machine, members)
  end

  ## Client API

  def new(serverid) do
    :ra.process_command(serverid, {:new})
  end

  def get(serverid, key) do
    :ra.process_command(serverid, {:get, key})
  end

  def set(serverid, key, feed = %Dat.Hypercore.Feed{}, index, config = %Dat.Hypercore.Config{}) do
    :ra.process_command(serverid, {:set, key, feed, index, config})
  end

  def append(serverid, key, block) do
    :ra.process_command(serverid, {:append, key, block})
  end
end
