class ReturnStatus
end

#
# Usage: GET OPTION <filename> <escape_digits> [timeout]
# Behaves similar to STREAM FILE but used with a timeout option.
#

# ToDo: add endpos method
class GetOption < ReturnStatus
  def to_s
    result
  end  
  
  def == (obj)
    obj.to_s == result
  end  
  
  private
  def result
    if @result.nil?
      rgx = Regexp.new(/(\d{3}) result=(\d+|\-\d+) endpos=(\d+)/)
      m = rgx.match(@responses)
      raise SayAlphaError, "Unexpected result received while executing SAY ALPHA" if m.nil? or m[2].nil? 
      @result = m[2]    
    end
    
    @result   
  end
end