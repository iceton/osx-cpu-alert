#!/usr/local/bin/ruby

max_load = 3

load = `sysctl -n vm.loadavg`
puts load
load_5min = load.split(" ")[2].to_f
puts load_5min
if load_5min > max_load
  ps1 = `ps aux -r`.split("\n")[1].split(" ")
  ps1_basename = File.basename(ps1.last)
  `osascript -e 'display notification "#{load_5min} load > #{max_load} max\n#{ps1[2]}% #{ps1_basename}" with title "High Load"'`
end
