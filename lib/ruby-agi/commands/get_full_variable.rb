
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
  # Usage: GET FULL VARIABLE <variablename> [<channel name>]
  #	Returns 0 if <variablename> is not set or channel does not exist.  
  # Returns 1 if <variablename>  is set and returns the variable in parenthesis.
  # Understands complex variable names and builtin variables, unlike GET VARIABLE.
  # example return code: 200 result=1 (testvariable)
  #
  def self.get_full_variable(variablename, channel_name)
    self.logger :info, "AGI::get_full_variable"
    cmd = "GET FULL VARIABLE #{variablename.to_s} #{channel_name.to_s if channel_name}"
    self.exec_command(cmd, GetFullVariable)
  end
end
