# Panning

pan1 = 1
pan2 = -1

live_loop :one do
  if pan1 > 0
    sample :misc_crow, pan: pan1
    pan1 -= 0.1
  end
  
  sleep rrand(1, 3)
end

live_loop :two do
  if pan2 < 0
    sample :misc_crow, pan: pan2
    pan2 += 0.1
  end
  
  sleep rrand(0, 2)
end
