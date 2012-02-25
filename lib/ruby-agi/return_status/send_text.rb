class ReturnStatus
end


#
# Usage: SEND TEXT "<text to send>"
# the given text on a channel. 
# Most channels do not support the transmission of text.  
# Returns 0 if text is sent, or if the channel does not support text transmission.  
# Returns -1 only on error/hangup.  
# Text consisting of greater than one word should be placed in quotes since the command only accepts a single argument.
#
class SendText < ReturnStatus
  def to_s
    result
  end  
  
  def == (obj)
    obj.to_s == result
  end  
  
  private
  def result
    if @result.nil?
      rgx = Regexp.new(/(\d{3}) result=(\d+|\-\d+)/)
      m = rgx.match(@responses)
      raise AGIError, "Unexpected result received while executing SEND TEXT" if m.nil? or m[2].nil? 
      @result = m[2]    
    end
    
    @result   
  end

end