class ReturnStatus
end


#
# Usage: DATABASE GET <family> <key>
# Retrieves an entry in the Asterisk database for a given family and key.
# Returns 0 if <key> is not set.  
# Returns 1 if <key> is set and returns the variable in parentheses.
# Example return code: 200 result=1 (testvariable)
#

class DatabaseGet < ReturnStatus
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