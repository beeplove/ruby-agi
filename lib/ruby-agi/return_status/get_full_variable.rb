class ReturnStatus
end


#
# Usage: GET FULL VARIABLE <variablename> [<channel name>]
#	Returns 0 if <variablename> is not set or channel does not exist.  
# Returns 1 if <variablename>  is set and returns the variable in parenthesis.
# Understands complex variable names and builtin variables, unlike GET VARIABLE.
# example return code: 200 result=1 (testvariable)
#

class GetFullVariable < ReturnStatus
  def to_s
    value
  end  
  
  def == (obj)
    obj.to_s == value
  end  

  
  # ToDo: Optimize the following method
  private
  def value
    if @value.nil?
      rgx = Regexp.new(/(\d{3}) result=(\d+|\-\d+)( \(.+\))*/)
      m = rgx.match(@responses)
      
      rgx_v = Regexp.new(/\((.+)\)/)
      m_v = rgx_v.match(m[3]) if m[3]
      @value = m.nil? ? '' : m[3] ?  m_v[1] : ''
    end
    
    @value      
  end

end