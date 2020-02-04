defmodule Dat.Hypercore.Config do
  @feed_size 8 * 1024 * 1024
  @message_size 10 * 1024 * 1024

  # "json" or "utf-8"
  defstruct value_encoding: "binary"
end

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

defmodule Dat.Hypercore do
  def new(config) do
  end

  def append(feed, block) do
    # blocking until data written
    {:error, 0}
  end

  def set(feed, index, {:config, timeout, value_encoding}) do
    # blocking until data downloaded
    {:error, %{}}
  end

  def get_batch(feed, start, _end, {:config, timeout, value_encoding}) do
    []
  end

  def head(feed, {:config, timeout, value_encoding}) do
    {:error, ''}
  end

  def download(feed, {:range, start, _end, linear}) do
    {:error, ['']}
  end

  def undownload(feed, {:range, start, _end, linear}) do
    {:error}
  end

  def signature(feed, {:index}) do
    {:error, 'last_signed_block', 'signature'}
  end

  def verify(feed, signature) do
    {:error, true}
  end

  def root_hashes(feed, index) do
    {:error, [{'roots', 'index', 'size', 'hash'}]}
  end

  # total_number_of_downloaded_blocks_within_range
  def downloaded(feed, start, _end) do
    0
  end

  def has_local(feed, index) do
    true
  end

  def has_local(feed, start, _end) do
    true
  end

  def clear do
  end

  def close do
  end

  def seek do
  end

  def update do
  end

  def set_downloading do
  end

  def set_uploading do
  end

  # create_read_stream

  # create_write_stream

  def is_writable do
  end

  def is_readable do
  end

  def key do
  end

  def discovery_key do
  end

  def length do
  end

  def byte_length do
  end

  def stats do
  end

  def on_peer_add do
  end

  def on_peer_remove do
  end

  def on_peer_open do
  end

  def connected_peers do
  end

  def register_replication_extension do
  end

  def send() do
  end

  def broadcast() do
  end

  def on_ready() do
  end

  def on_error() do
  end

  def on_download() do
  end

  def on_upload() do
  end

  def on_sync() do
  end

  def on_close() do
  end
end
