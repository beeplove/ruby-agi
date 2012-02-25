
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
  # Usage: GET VARIABLE <variablename>
  # Returns 0 if <variablename> is not set.
  # Returns 1 if <variablename> is set and returns the variable in parentheses.
  # example return code: 200 result=1 (testvariable)  
  #
  def self.method_name(name)
    self.logger :info, "AGI::method_name"
    cmd = "AGI COMMAND #{name.to_s}"
    self.exec_command(cmd, ReturnStatus)
  end
end
