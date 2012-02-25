module AGI

  #
  # Usage: SAY PHONETIC <string> <escape digits>
 	# Say a given character string with phonetics, returning early if any of the
  # given DTMF digits are received on the channel. Returns 0 if playback
  # completes without a digit pressed, the ASCII numerical value of the digit
  # if one was pressed, or -1 on error/hangup.
  #
  def self.say_phonetic(string, escape_digits)
    self.logger :info, "AGI::say_phonetic"    
    cmd = "SAY PHONETIC #{string.to_s}, #{escape_digits.to_s}"
    self.exec_command(cmd, SayPhonetic)
  end
end