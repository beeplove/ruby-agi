class ReturnStatus
end


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
class StreamFile < ReturnStatus
  def to_s
    result
  end  
  
  def == (obj)
    obj.to_s == result
  end  
  
  private
  def result
    if @result.nil?
      rgx = Regexp.new(/(\d{3}) result=(\d+|\-\d+) endpos=(\d+)/)
      m = rgx.match(@responses)
      raise AGIError, "Unexpected result received while executing STREAM FILE" if m.nil? or m[2].nil? 
      @result = m[2]    
    end
    
    @result   
  end

end