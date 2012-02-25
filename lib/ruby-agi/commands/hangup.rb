
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
  # Usage: HANGUP [<channelname>]
 	# Hangs up the specified channel.
  # If no channel name is given, hangs up the current channel
  #
  def self.hangup(channelname=nil)
    self.logger :info, "AGI::hangup"
    cmd = "HANGUP #{channelname.to_s}"
    self.exec_command(cmd, Hangup)
  end
end
