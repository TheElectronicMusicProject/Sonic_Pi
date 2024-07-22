# 13.2 Live Audio

# live_audio runs forever
with_fx :reverb do
  with_fx :echo do
    # Input 2 is treated as the right signal
    # Input 3 is treated as the left signal
    # This is achieved with the stereo opt    
    live_audio :foo, :stereo: true, input: 2
  end
end