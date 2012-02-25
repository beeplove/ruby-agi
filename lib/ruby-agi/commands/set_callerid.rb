
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
  # Usage: SET CALLERID <number>
 	# Changes the callerid of the current channel.
  #
  def self.set_callerid(number)
    self.logger :info, "AGI::set_callerid"
    cmd = "SET CALLERID #{number.to_s}"
    self.exec_command(cmd, SetCallerid)
  end
end
