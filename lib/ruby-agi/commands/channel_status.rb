
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
  # Usage: CHANNEL STATUS [<channelname>]
 	# Returns the status of the specified channel.
  # If no channel name is given the returns the status of the
  # current channel.  Return values:
  #  0 Channel is down and available
  #  1 Channel is down, but reserved
  #  2 Channel is off hook
  #  3 Digits (or equivalent) have been dialed
  #  4 Line is ringing
  #  5 Remote end is ringing
  #  6 Line is up
  #  7 Line is busy 
  #
  def self.channel_status(channel_name=nil)
    self.logger :info, "AGI::channel_status"
    cmd = "CHANNEL STATUS #{channel_name.to_s}"
    self.exec_command(cmd, ChannelStatus)
  end
end
