#!/usr/local/bin/ruby

max = 3

load = `sysctl -n vm.loadavg`
puts load
load5 = load.split(" ")[2].to_f
puts load5
if load5 > max
  `osascript -e 'display notification "5 minute load is above max\n#{load5} > #{max}" with title "High Load"'`
end
