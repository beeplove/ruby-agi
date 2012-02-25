class ReturnStatus
end


#
# VERBOSE <message> <level>
# Sends <message> to the console via verbose message system.
# <level> is the the verbose level (1-4)
# Always returns 1.
#
class Verbose < ReturnStatus
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
      raise SayPhoneticError, "Unexpected result received while executing VERBOSE" if m.nil? or m[2].nil? 
      @result = m[2]    
    end
    
    @result   
  end

end