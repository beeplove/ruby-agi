
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
  # Usage: GET OPTION <filename> <escape_digits> [timeout]
 	# Behaves similar to STREAM FILE but used with a timeout option.
  #
  
  # ToDo: Default timeout unit is mili-seconds, make it seconds or mili-second, i.e. more user friendly  
  def self.get_option(filename, escape_digits, timeout=nil)
    self.logger :info, "AGI::get_option"
    cmd = "GET OPTION #{filename.to_s} #{escape_digits.to_s} #{timeout.to_s}"
    self.exec_command(cmd, GetOption)
  end
end
