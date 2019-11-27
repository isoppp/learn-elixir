## Time - has or handle only today's time

IO.inspect(Time.utc_now) # ~T[08:49:09.894520] (now)
IO.inspect(~T[08:49:09.894520]) # same to above

t = ~T[08:49:09.894520]

IO.inspect(t.hour)
IO.inspect(t.minute)
# IO.inspect(t.day) # error

## Date
IO.inspect(Date.utc_today) # ~D[2019-11-24]
date = ~D[2019-11-24]
IO.inspect(Date.day_of_week(date))
IO.inspect(Date.leap_year?(date)) # 2/29


## Native Date Time
IO.inspect(NaiveDateTime.utc_now) # ~N[2019-11-24 08:57:53.829572]
IO.inspect(NaiveDateTime.add(~N[2019-11-24 08:57:53.829572], 7)) # ~N[2019-11-24 08:58:05.856319]

