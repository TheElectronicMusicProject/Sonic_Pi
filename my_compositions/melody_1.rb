live_loop :beat do
  bt = sample :bass_dnb_f, amp: 1, beat_stretch: 1, cutoff: rrand(80, 130), cutoff_slide: 8
  sleep 8
end

live_loop :rythm1 do
  sample :bd_tek
  sleep 0.5
  sample :hat_metal
  sleep 0.5
end

live_loop :rythm2 do
  sample :hat_snap, amp: 0.4, cutoff: 125
  sleep 0.25
end

with_fx :reverb do
  live_loop :synth do
    use_random_seed 1000
    my_synth = use_synth :mod_saw
    nt = (scale :c3, :minor_pentatonic).shuffle
    
    with_fx :slicer, phase: 0.125, smooth: 0.1 do
      #with_fx :slicer, phase: 0.25, smooth: 0.1 do
      16.times do
        play my_synth, note: nt.tick, cutoff: rrand(40, 90), attack: 0, release: 0.125, pan: rrand(-0.5, 0.5), amp: 0.8
        sleep 0.125
      end
    end
  end
end

with_fx :tremolo, wave: 0, depth: 1, phase: 0.25 do
  live_loop :super do
    val = 130
    my_synth = synth :tb303, note: :C2, cutoff: val, release: 4, amp: 1
    sleep 1
    
    3.times do
      val -= 20
      control my_synth, note: (chord :C2, :minor).choose, cutoff: val
      #control my_synth, note: :C2, cutoff: val
      sleep 1
    end
  end
end