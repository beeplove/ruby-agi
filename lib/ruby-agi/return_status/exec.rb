class ReturnStatus
end


#
# Usage: EXEC <application> <options>
# Executes <application> with given <options>.
# Returns whatever the application returns, or -2 on failure to find application
#

class Exec < ReturnStatus
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