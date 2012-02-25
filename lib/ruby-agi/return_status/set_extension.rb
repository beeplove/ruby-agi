class ReturnStatus
end


#
# Usage: SET EXTENSION <new extension>
# Changes the extension for continuation upon exiting the application.
#
class SetExtension < ReturnStatus
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
      raise AGIError, "Unexpected result received while executing SET EXTENSION" if m.nil? or m[2].nil? 
      @result = m[2]    
    end
    
    @result   
  end

end