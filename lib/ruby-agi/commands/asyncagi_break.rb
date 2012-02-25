
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
  # Interrupts expected flow of Async AGI commands and 
  # returns control to previous source (typically, the PBX dialplan).
  #
  def self.asyncagi_break
    self.logger :info, "AGI::asyncagi_break"
    cmd = "ASYNCAGI BREAK"
    self.exec_command(cmd, AsyncagiBreak)
  end
end