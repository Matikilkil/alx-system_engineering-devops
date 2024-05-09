#!/usr/bin/env ruby

log_file = ARGV[0]

log_data = File.read(log_file)

regex_pattern = /\[from:(.*?)\] \[to:(.*?)\] \[flags:(.*?)\]/

log_data.scan(regex_pattern) do |sender, receiver, flags|

  puts "#{sender},#{receiver},#{flags}"
end
