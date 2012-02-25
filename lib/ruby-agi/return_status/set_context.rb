class ReturnStatus
end


#
# Usage: SET CONTEXT <desired context>
# Sets the context for continuation upon exiting the application.
#

class SetContext < ReturnStatus
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
      raise SayPhoneticError, "Unexpected result received while executing SAY PHONETIC" if m.nil? or m[2].nil? 
      @result = m[2]    
    end
    
    @result   
  end

end