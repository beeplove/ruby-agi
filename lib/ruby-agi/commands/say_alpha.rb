
module AGI

  #
  # Usage: SAY ALPHA <number> <escape digits>
 	# Say a given character string, returning early if any of the given DTMF digits
  # are received on the channel. Returns 0 if playback completes without a digit
  # being pressed, or the ASCII numerical value of the digit if one was pressed or
  # -1 on error/hangup.  
  #
  def self.say_alpha(number, escape_digits)
    self.logger :info, "AGI::say_alpha"    
    cmd = "SAY ALPHA #{number.to_s} #{escape_digits.to_s}"
    self.exec_command(cmd, SayAlpha)
  end
end