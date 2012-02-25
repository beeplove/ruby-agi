module AGI
  
  #
  # Usage: DATABASE PUT <family> <key> <value>
  #	Adds or updates an entry in the Asterisk database for a given family, key, and value.
  # Returns 1 if successful, 0 otherwise.
  #
  def self.database_put(family, key, value)
    self.logger :info, "AGI::database_put"    
    cmd = "DATABASE PUT #{family.to_s} #{key.to_s} #{value.to_s}"
    self.exec_command(cmd, DatabasePut)
  end  
end