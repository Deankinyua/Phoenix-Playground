defmodule PhoenixPlayground.DealTime do
  def manipulate_time do
    {date, time} = :calendar.local_time()

    # * After converting the time to a Time struct , you can now compute the difference easily
    # * using Time.diff/3

    Time.from_erl!(time)
    Date.from_erl!(date)
  end
end
