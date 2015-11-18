#!/usr/local/bin/ruby

max = 3

load = `sysctl -n vm.loadavg`
puts load
load5 = /^\{ \S+ (\S+)/.match(load)[1].to_f
puts load5
if load5 > max
  `osascript -e 'display notification "5 minute load is above max" with title "HIGH LOAD"'`
end
