class ReturnStatus
end


#
# Usage: RECEIVE CHAR <timeout>
# Receives a character of text on a channel. 
# Specify timeout to be the maximum time to wait for input in milliseconds, or 0 for infinite. 
# Most channels do not support the reception of text. 
# Returns the decimal value of the character if one is received, or 0 if the channel does not support text reception.  
# Returns -1 only on error/hangup.
#

class ReceiveChar < ReturnStatus
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
      raise AGIError, "Unexpected result received while executing CHANNEL STATUS" if m.nil? or m[2].nil? 
      @result = m[2]    
    end
    
    @result   
  end

end