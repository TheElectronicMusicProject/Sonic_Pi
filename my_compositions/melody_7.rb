# The library "library_launchpad_mk2" from Circuitry Passion is needed
# THe Launchpad MK2 by Novation is needed

launchpad_in = "/midi:launchpad_mk2_14_launchpad_mk2_14_midi_1_24_0:"

use_debug false

led_off_color = 0x73

set_layout 0
set_led_all led_off_color

define :midi_note do |note_in, velocity_in, note, colour, sample_name|
  at do
    if note == note_in
      if velocity_in != 0
        set_led(note, colour, true)
        sample sample_name
      else
        #set_led_all led_off_color
        set_led(note, led_off_color, true)
      end
    end
  end
end

define :midi_loop_left do |note_in, velocity_in, note, colour, sample_name|
  at do
    if note == note_in
      index = 0
      if velocity_in != 0
        sample sample_name
        
        8.times do
          set_led(note + index, colour, true)
          index += 1
          sleep sample_duration(sample_name)/8
        end
        
        8.times do
          index -= 1
          set_led(note + index, led_off_color, true)
        end
      end
    end
  end
end

define :midi_loop_right do |note_in, velocity_in, note, colour, sample_name|
  at do
    if note == note_in
      index = 0
      if velocity_in != 0
        sample sample_name
        
        8.times do
          set_led(note - index, colour, true)
          index += 1
          sleep sample_duration(sample_name)/8
        end
        
        8.times do
          index -= 1
          set_led(note - index, led_off_color, true)
        end
      end
    end
  end
end

live_loop :midi_in do
  use_real_time
  
  note, velocity = sync launchpad_in + "1/note_on"
  
  midi_note(note, velocity, 0x0B, 0x10, :hat_noiz)
  midi_note(note, velocity, 0x0C, 0x11, :hat_snap)
  midi_note(note, velocity, 0x0D, 0x12, :hat_metal)
  midi_note(note, velocity, 0x0E, 0x13, :drum_heavy_kick)
  midi_note(note, velocity, 0x0F, 0x14, :drum_tom_mid_soft)
  midi_note(note, velocity, 0x10, 0x15, :drum_tom_mid_hard)
  midi_note(note, velocity, 0x11, 0x16, :drum_snare_soft)
  midi_note(note, velocity, 0x12, 0x17, :drum_snare_hard)
  midi_note(note, velocity, 0x15, 0x18, :drum_cymbal_open)
  midi_note(note, velocity, 0x16, 0x19, :drum_cymbal_closed)
  midi_note(note, velocity, 0x17, 0x1A, :drum_bass_soft)
  midi_note(note, velocity, 0x18, 0x1B, :drum_bass_hard)
  midi_note(note, velocity, 0x19, 0x1C, :elec_pop)
  midi_note(note, velocity, 0x1A, 0x1D, :elec_tick)
  midi_note(note, velocity, 0x1B, 0x1E, :elec_blup)
  midi_note(note, velocity, 0x1C, 0x1F, :elec_beep)
  midi_note(note, velocity, 0x1E, 0x20, :perc_bell)
  midi_note(note, velocity, 0x1F, 0x21, :perc_snap)
  midi_note(note, velocity, 0x20, 0x22, :perc_snap2)
  midi_note(note, velocity, 0x21, 0x23, :ambi_soft_buzz)
  midi_note(note, velocity, 0x22, 0x24, :ambi_choir)
  midi_note(note, velocity, 0x23, 0x25, :ambi_piano)
  midi_note(note, velocity, 0x24, 0x26, :ambi_lunar_land)
  midi_note(note, velocity, 0x25, 0x27, :ambi_drone)
  midi_note(note, velocity, 0x26, 0x28, :ambi_glass_hum)
  
  midi_loop_left(note, velocity, 41, 0x27, :loop_amen)
  midi_loop_left(note, velocity, 51, 0x28, :loop_garzul)
  midi_loop_left(note, velocity, 61, 0x29, :loop_breakbeat)
  midi_loop_left(note, velocity, 71, 0x30, :loop_industrial)
  midi_loop_left(note, velocity, 81, 0x31, :loop_perc1)
  
  midi_loop_right(note, velocity, 88, 0x32, :loop_perc2)
  midi_loop_right(note, velocity, 78, 0x33, :loop_weirdo)
  midi_loop_right(note, velocity, 68, 0x34, :loop_mehackit1)
  midi_loop_right(note, velocity, 58, 0x35, :loop_mehackit2)
  midi_loop_right(note, velocity, 48, 0x36, :loop_electric)
end