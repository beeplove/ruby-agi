
module AGI
  #
  # method to read a variable
  #
  # <b>Parameters</b>
  # - name	: name of the variable to read
  #
  # <b>Returns</b>
  # - ReturnStatus object
  #  

  #
  # Usage: SEND IMAGE <image>
 	# Sends the given image on a channel. 
 	# Most channels do not support the transmission of images. 
 	# Returns 0 if image is sent, or if the channel does not support image transmission.  
 	# Returns -1 only on error/hangup. 
 	# Image names should not include extensions.
  #
  def self.send_image(image)
    self.logger :info, "AGI::send_image"
    cmd = "SEND IMAGE #{image.to_s}"
    self.exec_command(cmd, SendImage)
  end
end
