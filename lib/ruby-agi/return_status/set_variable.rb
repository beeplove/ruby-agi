class ReturnStatus
end


#
# Usage: SET VARIABLE <variablename> <value>
#

class SetVariable < ReturnStatus
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
      raise SetVariableError, "Unexpected result received while executing SET VARIABLE" if m.nil? or m[2].nil? 
      @result = m[2]    
    end
    
    @result   
  end

end