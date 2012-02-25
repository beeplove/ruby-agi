
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
  # Usage: SET AUTOHANGUP <time>
 	# Cause the channel to automatically hangup at <time> seconds in the future.  
 	# Of course it can be hungup before then as well. 
 	# Setting to 0 will cause the autohangup feature to be disabled on this channel.
  #
  def self.set_autohangup(time)
    self.logger :info, "AGI::set_autohangup"
    cmd = "SET AUTOHANGUP #{time.to_s}"
    self.exec_command(cmd, SetAutohangup)
  end
end
