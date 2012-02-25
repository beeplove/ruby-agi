
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
  # Usage: SET PRIORITY <priority>
 	# Changes the priority for continuation upon exiting the application.
  # The priority must be a valid priority or label.
  #
  def self.set_priority(priority)
    self.logger :info, "AGI::set_priority"
    cmd = "SET PRIORITY #{priority.to_s}"
    self.exec_command(cmd, SetPriority)
  end
end
