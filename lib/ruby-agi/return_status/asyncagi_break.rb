class ReturnStatus
end



#
# Interrupts expected flow of Async AGI commands and 
# returns control to previous source (typically, the PBX dialplan).
#
class AsyncagiBreak < ReturnStatus
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
      raise AGIError, "Unexpected result received while executing AsyncagiBreak" if m.nil? or m[2].nil? 
      @result = m[2]    
    end
    
    @result   
  end

end