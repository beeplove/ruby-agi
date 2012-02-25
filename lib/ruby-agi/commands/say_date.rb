
module AGI
  #
  # method to read a variable
  #
  # <b>Parameters</b>
  # - name	: name of the variable to read
  #
  # <b>Returns</b>
  # - ReturnStatus object
  #  

  #
  # Usage: SAY DATE <date> <escape digits>
 	# Say a given date, returning early if any of the given DTMF digits are received on the channel.  
 	# <date> is number of seconds elapsed since 00:00:00 on January 1, 1970, Coordinated Universal Time (UTC). 
 	# Returns 0 if playback completes without a digit being pressed, 
 	# or the ASCII numerical value of the digit if one was pressed or -1 on error/hangup.
 	#

  def self.say_date(date, escape_digits)
    self.logger :info, "AGI::say_date"
    cmd = "SAY date #{date.to_s} #{escape_digits.to_s} "
    self.exec_command(cmd, SayDate)
  end
end
