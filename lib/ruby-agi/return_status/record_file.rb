class ReturnStatus
end


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

class RecordFile < ReturnStatus
  def to_s
    result
  end  
  
  def == (obj)
    obj.to_s == result
  end  
  
  private
  # ToDo: need more code to get m[3]
  def result
    if @result.nil?
      rgx = Regexp.new(/(\d{3}) result=(\d+|\-\d+) (\(.*\)) endpos=(\d+)/)
      m = rgx.match(@responses)
      raise AGIError, "Unexpected result received while executing RECORD FILE" if m.nil? or m[2].nil? 
      @result = m[2]    
    end
    
    @result   
  end

end