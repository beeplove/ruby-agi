
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
  # Usage: STREAM FILE <filename> <escape digits> [sample offset]
 	# Send the given file, allowing playback to be interrupted by the given digits, if any. 
 	# Use double quotes for the digits if you wish none to be permitted. 
 	# If sample offset is provided then the audio will seek to sample offset before play starts.  
 	# Returns 0 if playback completes without a digit being pressed, 
 	# or the ASCII numerical value of the digit if one was pressed,
  # or -1 on error or if the channel was disconnected. 
  # Remember, the file extension must not be included in the filename.
  #
  def self.stream_file(filename, escape_digits, offset=nil)
    self.logger :info, "AGI::stream_file"
    cmd = "STREAM FILE \"#{filename.to_s}\" \"#{escape_digits.to_s}\" #{offset.to_s}"
    self.exec_command(cmd, StreamFile)
  end
end
