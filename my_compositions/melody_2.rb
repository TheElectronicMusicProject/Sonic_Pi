set_mixer_control! amp: 1

timing = 0.125

live_loop :synth_groove do
  use_random_seed 100
  
  num_times = 0
  
  16.times do
    use_synth :tb303
    play (scale :c2, :minor, num_oct: 2).shuffle.look, wave: 2, release: 0.25, cutoff: rrand(70, 120), amp: 0.5
    
    use_synth :dsaw
    play (scale :c3, :minor, num_oct: 2).shuffle.look, release: 0.25, cutoff: rrand(70, 120), amp: 0.5
    
    tick
    
    sleep timing * 2
    
    num_times += 1
    puts num_times
  end
end

live_loop :beat do
  sample :hat_tap, amp: 10
  sleep timing
  sample :hat_tap, amp: 10
  sleep timing
  sample :bd_boom, amp: 3
  sleep timing * 4
  sample :hat_tap, amp: 10
  sleep timing * 2
end

live_loop :bass do
  with_fx :reverb do
    with_fx :slicer, phase: 0.125, wave: 0 do
      sample :bass_hard_c, rate: 1
    end
  end
  
  sleep 8
end

live_loop :synth_control do
  my_piano = use_synth :piano
  
  if one_in(4)
    with_fx :tremolo, phase: 0.25, depth: 1, pre_amp: 1, invert_wave: 1, wave: 3 do
      play my_piano, note: :c2, release: 0.75, pan: rrand(-1, 1), amp: 1.5
    end
  end
  
  sleep 0.5
end