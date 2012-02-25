class ReturnStatus
end


#
# Usage: SEND IMAGE <image>
# Sends the given image on a channel. 
# Most channels do not support the transmission of images. 
# Returns 0 if image is sent, or if the channel does not support image transmission.  
# Returns -1 only on error/hangup. 
# Image names should not include extensions.
#
class SendImage < ReturnStatus
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
      raise AGIError, "Unexpected result received while executing SEND IMAGE" if m.nil? or m[2].nil? 
      @result = m[2]    
    end
    
    @result   
  end

end