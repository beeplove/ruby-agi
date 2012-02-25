class ReturnStatus
end

#
# Usage: SET AUTOHANGUP <time>
# Cause the channel to automatically hangup at <time> seconds in the future.  
# Of course it can be hungup before then as well. 
# Setting to 0 will cause the autohangup feature to be disabled on this channel.
#
class SetAutohangup < ReturnStatus
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
      raise AGIError, "Unexpected result received while executing SET AUTOHANGUP" if m.nil? or m[2].nil? 
      @result = m[2]    
    end
    
    @result   
  end

end