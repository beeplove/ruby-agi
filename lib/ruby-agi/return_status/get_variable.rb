class ReturnStatus
end


#
# Usage: GET VARIABLE <variablename>
# Returns 0 if <variablename> is not set.
# Returns 1 if <variablename> is set and returns the variable in parentheses.
# example return code: 200 result=1 (testvariable)  
#

class GetVariable < ReturnStatus
  def to_s
    value
  end  
  
  def == (obj)
    obj.to_s == value
  end  

  
  private
  def value
    if @value.nil?
      rgx = Regexp.new(/(\()(.+)(\))/)
      m = rgx.match(@responses)
      @value = m.nil? ? '' : m[2]    
    end
    
    @value      
  end

end