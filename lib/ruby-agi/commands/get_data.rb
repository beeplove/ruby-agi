
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
  # Usage: GET DATA <file to be streamed> [timeout] [max digits]
  # Stream the given file, and recieve DTMF data. 
  # Returns the digits received from the channel at the other end.
  #
  
  # ToDo: Default timeout unit is mili-seconds, make it seconds or mili-second, i.e. more user friendly
  def self.get_data(filename, timeout=nil, max_digits=nil)
    self.logger :info, "AGI::get_data"
    cmd = "GET DATA #{filename.to_s} #{timeout.to_s} #{max_digits.to_s}"
    self.exec_command(cmd, GetData)
  end
end
