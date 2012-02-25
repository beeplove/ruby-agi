
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
  # Usage: WAIT FOR DIGIT <timeout>
 	# Waits up to 'timeout' milliseconds for channel to receive a DTMF digit.
  # Returns -1 on channel failure, 0 if no digit is received in the timeout, 
  # or the numerical value of the ascii of the digit if one is received.  
  # Use -1 for the timeout value if you desire the call to block indefinitely.
  #
  def self.wait_for_digit(timeout)
    self.logger :info, "AGI::wait_for_digit"
    cmd = "WAIT FOR DIGIT #{timeout.to_s}"
    self.exec_command(cmd, WaitForDigit)
  end
end
