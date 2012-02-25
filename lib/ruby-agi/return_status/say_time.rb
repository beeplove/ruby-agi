class ReturnStatus
end


#
# Usage: SAY DATE <date> <escape digits>
# Say a given date, returning early if any of the given DTMF digits are received on the channel.  
# <date> is number of seconds elapsed since 00:00:00 on January 1, 1970, Coordinated Universal Time (UTC). 
# Returns 0 if playback completes without a digit being pressed, 
# or the ASCII numerical value of the digit if one was pressed or -1 on error/hangup.
#
class SayTime < ReturnStatus
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
      raise AGIError, "Unexpected result received while executing SAY TIME" if m.nil? or m[2].nil? 
      @result = m[2]    
    end
    
    @result   
  end

end