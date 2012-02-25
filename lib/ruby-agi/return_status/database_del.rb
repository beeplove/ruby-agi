class ReturnStatus
end


#
# Usage: DATABASE DEL <family> <key>
# Deletes an entry in the Asterisk database for a given family and key.
# Returns 1 if successful, 0 otherwise.
#

class DatabaseDel < ReturnStatus
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
      raise DatabaseDelError, "Unexpected result received while executing DATABASE DEL" if m.nil? or m[2].nil? 
      @result = m[2]    
    end
    
    @result   
  end

end