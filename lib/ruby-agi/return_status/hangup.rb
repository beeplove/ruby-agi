class ReturnStatus
end



#
# Usage: HANGUP [<channelname>]
# Hangs up the specified channel.
# If no channel name is given, hangs up the current channel
#
class Hangup < ReturnStatus
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
      raise AGIError, "Unexpected result received while executing HANGUP" if m.nil? or m[2].nil? 
      @result = m[2]    
    end
    
    @result   
  end

end