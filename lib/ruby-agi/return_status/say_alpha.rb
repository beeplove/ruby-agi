class ReturnStatus
end


#
# Usage: SAY ALPHA <number> <escape digits>
# Say a given character string, returning early if any of the given DTMF digits
# are received on the channel. Returns 0 if playback completes without a digit
# being pressed, or the ASCII numerical value of the digit if one was pressed or
# -1 on error/hangup.  
#

class SayAlpha < ReturnStatus
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
      raise SayAlphaError, "Unexpected result received while executing SAY ALPHA" if m.nil? or m[2].nil? 
      @result = m[2]    
    end
    
    @result   
  end

end