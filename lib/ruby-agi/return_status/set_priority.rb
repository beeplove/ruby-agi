class ReturnStatus
end


#
# Usage: SET PRIORITY <priority>
# Changes the priority for continuation upon exiting the application.
# The priority must be a valid priority or label.
#
class SetPriority < ReturnStatus
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
      raise AGIError, "Unexpected result received while executing SET PRIORITY" if m.nil? or m[2].nil? 
      @result = m[2]    
    end
    
    @result   
  end

end