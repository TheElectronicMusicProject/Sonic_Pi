# 13.3 Sound Out

# The normal behaviour goes from A to C
with_fx :reverb do    # C
  with_fx :echo do    # B
    sample :bd_haus   # A
  end
end

# sound_out outputs the audio as described above but also outputs the audio directly to an output of the sound card
# In this case bd_haus outputs to its extenal context (sound_out) and then to reverb
# But also outputs a mono mix to the 3rd output of the soundcard
# Hence there are 2 destinations of A, one is C and one is B
with_fx :reverb do      # C
  with_fx :sound_out, output: 3 do # B
    sample :bd_haus     # A
  end
end

# To avoid sending the same audio to multiple outputs amp can be used
# In this case, loop_amen has been sent to audio card output 3 but it's silenced
# Therefore the signal is sent out to outer context (standard output) as a mono mix
with_fx :sound_out, output: 3, amp: 0 do # B
  sample :loop_amen                      # A
end