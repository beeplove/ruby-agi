
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
  # Usage: ANSWER
 	# Answers channel if not already in answer state. Returns -1 on
  # channel failure, or 0 if successful. 
  #
  def self.answer
    self.logger :info, "AGI::answer"
    cmd = "ANSWER"
    self.exec_command(cmd, Answer)
  end
end
