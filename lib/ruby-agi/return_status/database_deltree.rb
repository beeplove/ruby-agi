class ReturnStatus
end


#
# Usage: DATABASE DELTREE <family> [keytree]
# Deletes a family or specific keytree within a family in the Asterisk database.
# Returns 1 if successful, 0 otherwise.
#

class DatabaseDeltree < ReturnStatus
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
      raise DatabaseDeltreeError, "Unexpected result received while executing DATABASE DELTREE" if m.nil? or m[2].nil? 
      @result = m[2]    
    end
    
    @result   
  end

end