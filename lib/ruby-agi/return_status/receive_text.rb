class ReturnStatus
end


#
# Usage: RECEIVE TEXT <timeout>
# Receives a string of text on a channel. 
# Specify timeout to be the maximum time to wait for input in milliseconds, or 0 for infinite. 
# Most channels do not support the reception of text. 
# Returns -1 for failure or 1 for success, and the string in parentheses.
#

class ReceiveText < ReturnStatus
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
      raise AGIError, "Unexpected result received while executing RECEIVE TEXT" if m.nil? or m[2].nil? 
      @result = m[2]    
    end
    
    @result   
  end

end