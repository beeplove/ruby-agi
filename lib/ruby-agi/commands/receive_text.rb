
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
  # Usage: RECEIVE TEXT <timeout>
 	# Receives a string of text on a channel. 
 	# Specify timeout to be the maximum time to wait for input in milliseconds, or 0 for infinite. 
 	# Most channels do not support the reception of text. 
 	# Returns -1 for failure or 1 for success, and the string in parentheses.
  #
  def self.receive_text(timeout)
    self.logger :info, "AGI::receive_text"
    cmd = "RECEIVE TEXT #{timeout.to_s}"
    self.exec_command(cmd, ReceiveText)
  end
end
