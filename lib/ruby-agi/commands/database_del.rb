module AGI
  
  #
  # Usage: DATABASE DEL <family> <key>
 	# Deletes an entry in the Asterisk database for a given family and key.
  # Returns 1 if successful, 0 otherwise.
  #
  def self.database_del(family, key)
    self.logger :info, "AGI::database_del"    
    cmd = "DATABASE DEL #{family.to_s} #{key.to_s}"
    self.exec_command(cmd, DatabaseDel)
  end  
end