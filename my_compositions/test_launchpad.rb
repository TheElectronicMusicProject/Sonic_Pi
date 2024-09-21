# Novation Launchpad MK2

launchpad_in = "/midi:launchpad_mk2_14_launchpad_mk2_14_midi_1_24_0:*"

using_layout = 0
sleep_before_cmd = 0.01

# BASIC COMMUNICATION
# Central grid of 64 square buttons + 8 right-hand round buttons
# send a note-on message with maximum velocity when pressed,
# 0 velocity when released.
# The top row of round buttons sends control change messages
# with value of 7Fh when pressed and 0 when released.

# LAYOUTS
# There are 3 layouts which respond to note messages:
# Session, User 1, User 2 (plus volume and pan).
# To change the button layout (host > Launchpad):
# F0h, 00h, 20h, 29h, 02h, 18h, 22h, <LAYOUT>, F7h
# where <LAYOUT> could be:
# ## 00h - Session: for writing software that uses the Launchpad
#                   as a grid that is easy to navigate by adding
#                   and subtracting (adding 1 moves to the right
#                   1 button, adding 10 moves up one button).
# ## 01h - User 1 (drum rack): for Lanchpad that must launch samples
#                              or deal with musical MIDI.
# ## 02h - User 2: same as Session.
# ## 03h - (reserved for Ableton Live)
# ## 04h - Volume style faders: can't be mixed with pan style. It
#                               needs to be initialised after that.
# ## 05h - Pan style faders: can't be mixed with volume style. It
#                            needs to be initialised after that.
# The controller numbers from top row does not change with layout
# and are always from 68h to 6Fh.

define :set_layout do |layout=0x00|
  puts "Set layout to #{layout}"
  sleep sleep_before_cmd
  midi_sysex 0xF0, 0x00, 0x20, 0x29, 0x02, 0x18, 0x22, *layout, 0xF7
  
  using_layout = layout
end # set_layout

# CHANNELS
# To avoid interference between layouts, each layout sends and receives
# messages on a different channel:
# ## 00h - Session: channel 1.
# ## 01h - User 1 (drum rack): channel 8 (can be changed from bootloader).
# ## 02h - User 2: channel 14 (can be changed from bootloader).
# 90h is channel 1, 91h is channel 2, ..., 9Fh is channel 16.
# To light the top-left LED blue in Session layout (host > Launchpad):
# 90h, 51h, 2Dh [note-on 81/51h, velocity 45/2Dh]
# Using the SysEx, there is an alternative to turn on more LEDs with a
# single command (taken to be the same as Session layout).

define :set_led do |position=0x0B, colour=0x00, use_sysex=false|
  if colour >= 127
    *colour = 127
  end
  
  if use_sysex == false
    midi_raw 0x90, *position, 0x00
    sleep sleep_before_cmd
    midi_raw 0x90, *position, *colour
  else
    # Message can be repeated up to 80 times.
    sleep sleep_before_cmd
    midi_sysex 0xF0, 0x00, 0x20, 0x29, 0x02, 0x18, 0x0A, *position, *colour, 0xF7
  end
end # set_led

define :set_led_column do |column=0x00, colour=0x00|
  if colour >= 127
    *colour = 127
  end
  
  # Message can be repeated up to 9 times.
  # Numbered from 0 to 8.
  sleep sleep_before_cmd
  midi_sysex 0xF0, 0x00, 0x20, 0x29, 0x02, 0x18, 0x0C, *column, *colour, 0xF7
end # set_led_column

define :set_led_row do |row=0x00, colour=0x00|
  if colour >= 127
    *colour = 127
  end
  
  # Message can be repeated up to 9 times.
  # Numbered from 0 to 8.
  sleep sleep_before_cmd
  midi_sysex 0xF0, 0x00, 0x20, 0x29, 0x02, 0x18, 0x0D, *row, *colour, 0xF7
end # set_led_row

define :set_led_all do |colour=0x00|
  if colour >= 127
    *colour = 127
  end
  
  # Message cannot be repeated.
  sleep sleep_before_cmd
  midi_sysex 0xF0, 0x00, 0x20, 0x29, 0x02, 0x18, 0x0E, *colour, 0xF7
end # set_led_all

# FLASHING
# Flashing support between two colours on all the 3 layouts.
# Set by sending a note-on message on channel 2.
# It begins to flash between colour B and the current colour A with a
# 50% of duty cycle, synced with MIDI beat clock.
# Flashing can be stopped by sending a message on channel 1.
# 90h is channel 1, 91h is channel 2, ..., 9Fh is channel 16.
# To light the second-from-bottom left LED orange in Session layout
# (host > Launchpad):
# 91h, 28h, 09h [note-on 40/28h, velocity 9/09h]
# Using the SysEx, there is an alternative to turn on more LEDs with a
# single command (taken to be the same as Session layout).

define :set_led_flashing do |position=0x0B, colour=0x00, use_sysex=false|
  if colour >= 127
    *colour = 127
  end
  
  if use_sysex == false
    midi_raw 0x90, *position, 0x00
    sleep sleep_before_cmd
    midi_raw 0x91, *position, *colour
  else
    # Message can be repeated up to 80 times.
    sleep sleep_before_cmd
    midi_sysex 0xF0, 0x00, 0x20, 0x29, 0x02, 0x18, 0x23, 0x00, *position, *colour, 0xF7
  end
end # set_led_flashing

# PULSING
# The colour of the LED rhythmically increases and decreases in
# brightness.
# It needs a note-on message (or CC for the 8 top buttons) on channel 3
# and is stopped with a message on channel 1.
# To light the top right grid LED purple in Session layout
# (host > Launchpad):
# 92h, 58h, 51h [note-on 88/58h, velocity 81/51h]
# Using the SysEx, there is an alternative to turn on more LEDs with a
# single command (taken to be the same as Session layout).

define :set_led_pulsing do |position=0x0B, colour=0x00, use_sysex=false|
  if colour >= 127
    *colour = 127
  end
  
  if use_sysex == false
    midi_raw 0x90, *position, 0x00
    sleep sleep_before_cmd
    midi_raw 0x92, *position, *colour
  else
    # Message can be repeated up to 80 times.
    sleep sleep_before_cmd
    midi_sysex 0xF0, 0x00, 0x20, 0x29, 0x02, 0x18, 0x28, 0x00, *position, *colour, 0xF7
  end
end # set_led_pulsing

# RGB MODE
# The brightness of the individual red, green and blue element of the LED
# can be controlled to create any colour.
# Each element has a value from 00h (0) to 3Fh (63).

define :set_led_rgb do |position=0x0B, colour=[0x00, 0x00, 0x00]|
  if colour[0] >= 127
    *colour[0] = 127
  end
  
  if colour[1] >= 127
    *colour[1] = 127
  end
  
  if colour[2] >= 127
    *colour[2] = 127
  end
  
  # Message can be repeated up to 80 times.
  sleep sleep_before_cmd
  midi_sysex 0xF0, 0x00, 0x20, 0x29, 0x02, 0x18, 0x0B, *position, *colour, 0xF7
end # set_led

# DEVICE INQUIRY
# Launchpad responds to the MIDI specification's Device Inquiry message.
# If the device ID is 7Fh, all launchpad MK2s will respond.
# To get the Device Inquiry (host > Launchpad):
# F0h, 7Eh, 7Fh, 06h, 01h, F7h
# The response is (Launchpad > host):
# 240, 126, <DEVICE ID>, 6, 2, 0, 32, 41, 105, 0, 0, 0,
# <FIRMWARE REVISION (4 BYTES)>, 247
# Where <FIRMWARE REVISION (4 BYTES)> is represented by 4 bytes, e.g.
# revision 171 would be 0, 1, 7, 1.

define :get_device_inquiry do
  sleep sleep_before_cmd
  midi_sysex 0xF0, 0x7E, 0x7F, 0x06, 0x01, 0xF7
end # get_device_inquiry

# VERSION INQUIRY
# Bootloader version, firmware version, size (in KB) of the bootloader.
# To get the Version Inquiry (host > Launchpad):
# F0h, 00h, 20h, 29h, 00h, 70h, F7h
# The response is (Launchpad > host) the requested data.

define :get_version_inquiry do
  sleep sleep_before_cmd
  midi_sysex 0xF0, 0x00, 0x20, 0x29, 0x00, 0x70, 0xF7
end # get_version_inquiry

# SET TO BOOTLOADER
# Force the Launchpad into bootloader mode.
# To get into the bootloader (host > Launchpad):
# F0h, 00h, 20h, 29h, 00h, 71h, 00h, 69h, F7h

define :set_to_bootloader do
  sleep sleep_before_cmd
  midi_sysex 0xF0, 0x00, 0x20, 0x29, 0x00, 0x71, 0x00, 0x69, 0xF7
end # set_to_bootloader

# MIDI CLOCK
# By default the Launchpad has a flash and pulse period at 120 BPM.
# It can be altered by sending F8h (248) messages which should be sent
# at a rate of 24 per beat.
# Launchpad MK2 supports tempos between 40 and 240 BPM.
# Using a midi_multiplier equal to 1 will make a periodic flash
# or pulse synced with the selected BPM.
# Using midi_multiplier greater than 1 (e.g. 2) will double the period.
# Using midi_multiplier less then 1 (e.g. 0.5) will halve the period.
# This funciton should be inside a live_loop function with a sleep 1.

define :set_midi_clock do |midi_multiplier=1|
  midi_clock_beat 1/midi_multiplier
end # set_midi_clock

# VIRTUAL FADERS
# After setting the layout with volume style faders (04h, 4) or volume
# style faders (05h, 5), they need to be initialised.
# Fader lights up according to its current value: volume fader lights
# from bottom up, pan fader lights from centre out.
# To get the Device Inquiry (host > Launchpad):
# F0h, 00h, 20h, 29h, 02h, 18h, 2Bh, <NUMBER>, <TYPE>, <COLOUR>,
# <VALUE>, F7h
# where <NUMBER> could be:
# ## From 00h (0) to 07h (7) which is the index of the fader, numbered
#    left to right.
# where <TYPE> could be:
# ## From 00h (0) to 01h (1) this must match the selected layout.
# where <COLOUR> could be:
# ## From 00h (0) to 7Fh (127) to set the colour
# where <VALUE> could be:
# ## From 00h (0) to 7Fh (127) to set the initial value position of
#    the fader.

define :fader_init do |number=0x00, colour=0x00, block=0x00|
  # Message can be repeated up to 8 times.
  sleep sleep_before_cmd
  value = block*127/8
  
  if using_layout == 0x04
    midi_sysex 0xF0, 0x00, 0x20, 0x29, 0x02, 0x18, 0x2B, *number, 0x00, *colour, *value, 0xF7
  elsif using_layout == 0x05
    midi_sysex 0xF0, 0x00, 0x20, 0x29, 0x02, 0x18, 0x2B, *number, 0x01, *colour, *value, 0xF7
  end
end # fader_init

# TEXT SCROLLING
# ASCII text can be embedded in SyseEx messages.
# Further, it recognise plain values 1-7 as speed commands (from
# slowest to fastest). Default speed is 4
# When the text ends, the LEDs are restored to previous settings and
# a SysEx message is sent back to the host (Launchpad > host).
# To get the Device Inquiry (host > Launchpad):
# F0h, 00h, 20h, 29h, 02h, 18h, 14h, <COLOUR>, <LOOP>, <TEXT>, F7h
# where <COLOUR> could be:
# ## From 00h (0) to 07h (7) which is the text colour
# where <LOOP> could be:
# ## 00h: text stops after the first scroll
# ## 01h: text continues to scroll
# where <SPEED> could be:
# ## From 01h for low speed to 07h for high speed
# where <TEXT> could be:
# ## The ASCII text

define :set_text do |text="", colour=0x00, loop=0x00, speed=0x04|
  sleep sleep_before_cmd
  # Convert the string to characters
  text = text.chars.map {|b| b.ord}
  # Message cannot be repeated.
  midi_sysex 0xF0, 0x00, 0x20, 0x29, 0x02, 0x18, 0x14, *colour, *loop, *speed, *text, 0xF7
end # set_text

define :stop_text do
  sleep sleep_before_cmd
  midi_sysex 0xF0, 0x00, 0x20, 0x29, 0x02, 0x28, 0x14, 0xF7
end # stop_text

set_layout 0

set_led_all 115

index = 0

81.times do
  set_led_flashing 0x0B + index, 1 + index, true
  index += 1
end

comment do
  fader_init 0, 50, 1
  fader_init 1, 51, 1
  fader_init 2, 52, 1
  fader_init 3, 53, 1
  fader_init 4, 54, 1
  fader_init 5, 55, 1
  fader_init 6, 56, 1
  fader_init 7, 57, 1
end