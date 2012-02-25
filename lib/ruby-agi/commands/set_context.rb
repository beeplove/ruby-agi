module AGI
  
  #
  # Usage: SET CONTEXT <desired context>
 	# Sets the context for continuation upon exiting the application.
  #
  def self.set_context(context)
    self.logger :info, "AGI::set_context"    
    cmd = "SET CONTEXT #{context.to_s}"
    self.exec_command(cmd, SetContext)
  end  
end