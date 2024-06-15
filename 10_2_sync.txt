# 10.2 Synch

# "cue" is just a variation of "set"
# "sync" works seamlessly with Time State and any information stored can be used to sync (events)
# "sync" can be attached to future events, like a variable which doesn't exist yet

in_thread do
  amp = sync :foo
  sample :ambi_lunar_land, amp: amp
end

sleep 2

set :foo, 0.5