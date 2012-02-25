
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
  # Usage: SEND TEXT "<text to send>"
 	# the given text on a channel. 
 	# Most channels do not support the transmission of text.  
 	# Returns 0 if text is sent, or if the channel does not support text transmission.  
 	# Returns -1 only on error/hangup.  
 	# Text consisting of greater than one word should be placed in quotes since the command only accepts a single argument.
  #
  def self.send_text(text)
    self.logger :info, "AGI::send_text"
    cmd = "SEND TEXT \"#{text.to_s}\""
    self.exec_command(cmd, SendText)
  end
end
