class ReturnStatus
end


#
# Usage: DATABASE PUT <family> <key> <value>
#	Adds or updates an entry in the Asterisk database for a given family, key, and value.
# Returns 1 if successful, 0 otherwise.
#

class DatabasePut < ReturnStatus
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
      raise DatabasePutError, "Unexpected result received while executing CHANNEL STATUS" if m.nil? or m[2].nil? 
      @result = m[2]    
    end
    
    @result   
  end

end