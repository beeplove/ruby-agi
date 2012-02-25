
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
  # VERBOSE <message> <level>
 	# Sends <message> to the console via verbose message system.
  # <level> is the the verbose level (1-4)
  # Always returns 1.
  #
  def self.verbose(message, level)
    self.logger :info, "AGI::verbose"
    cmd = "VERBOSE \"#{message.to_s}\" #{level.to_s}"
    self.exec_command(cmd, Verbose)
  end
end
