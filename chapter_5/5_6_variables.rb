# 5.6 Variables

# Variable assignment - don't use the same variable in multiple live loops or threads
sample_name = :loop_amen
loop_amen_duration = sample_duration(sample_name)

loop do
  sample sample_name
  sleep loop_amen_duration
  
  puts "## end of first sample"
  
  sample sample_name, rate: 0.5
  sample_sleep = sample_duration(sample_name, rate: 0.5)
  sleep sample_sleep
  
  puts "## end of second sample"
  
  sample sample_name
  sleep loop_amen_duration
  
  puts "## end of third sample"
end