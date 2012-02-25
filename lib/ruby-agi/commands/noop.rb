
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
  # Usage: NoOp
 	# Does nothing.
  #
  def self.noop(msg)
    self.logger :info, "AGI::noop"
    cmd = "NOOP #{msg.to_s}"
    self.exec_command(cmd, Noop)
  end
end
