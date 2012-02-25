
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
  # Usage: RECORD FILE <filename> <format> <escape digits> <timeout> [offset samples] [BEEP] [s=silence]
 	# Record to a file until a given dtmf digit in the sequence is received
  # Returns -1 on hangup or error.  
  # The format will specify what kind of file will be recorded.  
  # The timeout is the maximum record time in milliseconds, or -1 for no timeout. 
  # "Offset samples" is optional, and, if provided, will seek to the offset without exceeding the end of the file.  
  # "silence" is the number of seconds of silence allowed before the function 
  # returns despite the lack of dtmf digits or reaching timeout.  
  # Silence value must be preceeded by "s=" and is also optional.
  #
  def self.record_file(filename, format, escape_digits, timeout, offset_samples=nil, beep=nil, silence=nil)
    self.logger :info, "AGI::record_file"
    cmd = "RECORD FILE #{filename.to_s} #{format.to_s} #{escape_digits.to_s} #{timeout.to_s}"
    cmd += ' ' + offset_samples.to_s  if offset_samples
    cmd += ' ' + 'BEEP'               if beep == true
    cmd += ' ' +  's=' + silence.to_s if silence
    self.exec_command(cmd, ReturnStatus)
  end
end
