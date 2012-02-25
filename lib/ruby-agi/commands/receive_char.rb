
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
  # Usage: RECEIVE CHAR <timeout>
 	# Receives a character of text on a channel. 
 	# Specify timeout to be the maximum time to wait for input in milliseconds, or 0 for infinite. 
 	# Most channels do not support the reception of text. 
 	# Returns the decimal value of the character if one is received, or 0 if the channel does not support text reception.  
 	# Returns -1 only on error/hangup.
  #
  def self.receive_char(timeout)
    self.logger :info, "AGI::receive_char"
    cmd = "RECEIVE CHAR #{timeout.to_s}"
    self.exec_command(cmd, ReceiveChar)
  end
end
