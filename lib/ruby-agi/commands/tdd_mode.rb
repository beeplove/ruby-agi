
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
  # Usage: TDD MODE <on|off>
 	# Enable/Disable TDD transmission/reception on a channel. 
 	# Returns 1 if successful, or 0 if channel is not TDD-capable.
  #
  def self.tdd_mode(mode)
    self.logger :info, "AGI::tdd_mode"
    cmd = "TDD MODE \"#{(mode == true or mode.upcase == 'ON') ? 'on' : 'off'}\""
    self.exec_command(cmd, TddMode)
  end
end
