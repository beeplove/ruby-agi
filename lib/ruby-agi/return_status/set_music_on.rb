class ReturnStatus
end


#
# Usage: SET MUSIC ON <on|off> <class>
# Enables/Disables the music on hold generator.  
# If <class> is not specified, then the default music on hold class will be used.
# Always returns 0.
#
class SetMusicOn < ReturnStatus
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
      raise AGIError, "Unexpected result received while executing SET MUSIC ON" if m.nil? or m[2].nil? 
      @result = m[2]    
    end
    
    @result   
  end

end