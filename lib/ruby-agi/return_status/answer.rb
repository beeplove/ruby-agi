class ReturnStatus
end


#
# Usage: ANSWER
# Answers channel if not already in answer state. Returns -1 on
# channel failure, or 0 if successful. 
#

class Answer < ReturnStatus
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
      raise AnswerError, "Unexpected result received while executing ANSWER" if m.nil? or m[2].nil? 
      @result = m[2]    
    end
    
    @result   
  end

end