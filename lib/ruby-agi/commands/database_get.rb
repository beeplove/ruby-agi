module AGI
  
  #
  # Usage: DATABASE GET <family> <key>
 	# Retrieves an entry in the Asterisk database for a given family and key.
  # Returns 0 if <key> is not set.  
  # Returns 1 if <key> is set and returns the variable in parentheses.
  # Example return code: 200 result=1 (testvariable)
  #
  def self.database_get(family, key)
    self.logger :info, "AGI::database_get"    
    cmd = "DATABASE GET #{family.to_s} #{key.to_s}"
    self.exec_command(cmd, DatabaseGet)
  end  
end