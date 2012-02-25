class ReturnStatus
end


#
# Usage: TDD MODE <on|off>
# Enable/Disable TDD transmission/reception on a channel. 
# Returns 1 if successful, or 0 if channel is not TDD-capable.
#
class TddMode < ReturnStatus
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
      raise AGIError, "Unexpected result received while executing TDD MODE" if m.nil? or m[2].nil? 
      @result = m[2]    
    end
    
    @result   
  end

end