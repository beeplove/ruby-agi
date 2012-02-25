class ReturnStatus
end


#
# Usage: GET DATA <file to be streamed> [timeout] [max digits]
# Stream the given file, and recieve DTMF data. 
# Returns the digits received from the channel at the other end.
#

class GetData < ReturnStatus
  def to_s
    result
  end  
  
  def == (obj)
    obj.to_s == result
  end  
  
  private
  def result
    if @result.nil?
      rgx = Regexp.new(/(\d{3}) result=(\d*|\-\d+)/)
      m = rgx.match(@responses)
      raise GetDataError, "Unexpected result received while executing GET DATA" if m.nil? or m[2].nil? 
      @result = m[2]    
    end
    
    @result   
  end

end