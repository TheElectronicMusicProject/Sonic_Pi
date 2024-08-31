# Effects

# with_fx permits to add effects
# mix: how much the effect and the original sound is head (0 for the original sound only, 1 for the FX only)

live_loop :effects do
  with_fx :wobble do
    with_fx :slicer do
      with_fx :reverb, mix: 0.5, room: 0.9 do
        play 50 # Note D3
        sleep 0.5
        sample :elec_plip
        sleep 0.5
        play 62 # Note D4
      end
    end
  end
end