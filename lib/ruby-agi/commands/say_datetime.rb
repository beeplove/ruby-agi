
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
  # Usage: SAY DATETIME <time> <escape digits> [format] [timezone]
 	# Say a given time, returning early if any of the given DTMF digits are received on the channel.  
 	# <time> is number of seconds elapsed since 00:00:00 on January 1, 1970, Coordinated Universal Time (UTC). 
 	# [format] is the format the time should be said in.  
 	# See voicemail.conf (defaults to "ABdY'digits/at' IMp").  
 	# Acceptable values for [timezone] can be found in /usr/share/zoneinfo.  
 	# Defaults to machine default. 
 	# Returns 0 if playback completes without a digit being pressed, 
 	# or the ASCII numerical value of the digit if one was pressed or -1 on error/hangup.
 	#

  def self.say_datetime(time, escape_digits)
    self.logger :info, "AGI::say_datetime"
    cmd = "SAY DATETIME #{time.to_s} #{escape_digits.to_s} "
    self.exec_command(cmd, SayDatetime)
  end
end
