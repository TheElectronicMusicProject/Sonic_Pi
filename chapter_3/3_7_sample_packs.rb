# 3.7 Sample Packs

# Raspberry Pi, Mac, Linux (the folder must have more files)
# We don't want to remember all the names, so index 0 will play the first one
# Putting a string between "" permits to filter the file name (more than one filter can be applied)
# More folders can be specified in a sample, to increase the candidates
# To select the subfolders too, we need to add ".../**" (will create an initial delay with a lot of files)
# For regular expressions: "/fo[oO]U/"
# For direct match of the filename ":foo"
my_path = "/home/pi/Music/"
my_sample = my_path, "sample", 1

loop do
  sample my_sample
  sleep sample_duration(my_sample)
end