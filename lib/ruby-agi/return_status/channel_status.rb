class ReturnStatus
end


#
# Usage: CHANNEL STATUS [<channelname>]
# Returns the status of the specified channel.
# If no channel name is given the returns the status of the
# current channel.  Return values:
#  0 Channel is down and available
#  1 Channel is down, but reserved
#  2 Channel is off hook
#  3 Digits (or equivalent) have been dialed
#  4 Line is ringing
#  5 Remote end is ringing
#  6 Line is up
#  7 Line is busy 
#
class ChannelStatus < ReturnStatus
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
      raise ChannelStatusError, "Unexpected result received while executing CHANNEL STATUS" if m.nil? or m[2].nil? 
      @result = m[2]    
    end
    
    @result   
  end

end