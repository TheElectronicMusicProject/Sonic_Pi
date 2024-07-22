# 12.2 Sending OSC

# This sends the OSC message to the Sonic Pi itself
# This creates the packet "/osc:127.0.0.1:4560/hello/world"
use_osc "localhost", 4560
osc "/hello/world"