class ReturnStatus
end


#
# Usage: WAIT FOR DIGIT <timeout>
# Waits up to 'timeout' milliseconds for channel to receive a DTMF digit.
# Returns -1 on channel failure, 0 if no digit is received in the timeout, 
# or the numerical value of the ascii of the digit if one is received.  
# Use -1 for the timeout value if you desire the call to block indefinitely.
#
class WaitForDigit < ReturnStatus
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
      raise AGIError, "Unexpected result received while executing WAIT FOR DIGIT" if m.nil? or m[2].nil? 
      @result = m[2]    
    end
    
    @result   
  end

end