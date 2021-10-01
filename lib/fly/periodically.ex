defmodule Fly.Periodically do
  use GenServer

  #require Logger

  @work_interval 5 #Wait 5 seconds between API refreshes

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{})
  end

  @impl true
  def init(state) do
    #Logger.info("PERIODICALLY STARTING")
    schedule_work(@work_interval * 1000) # Schedule work to be performed in work_interval seconds
    {:ok, state}
  end

  @impl true
  def handle_info(:work, state) do
    # Do the work you desire here
    #Logger.info("PERIODICALLY REFRESH BROADCAST")
    Phoenix.PubSub.broadcast(Fly.PubSub, "refresh", :refresh)
    schedule_work(@work_interval * 1000) # Reschedule once more
    {:noreply, state}
  end

  defp schedule_work(interval) do
    Process.send_after(self(), :work, interval)
  end
end
