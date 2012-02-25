
module AGI
  
  #
  # Usage: DATABASE DELTREE <family> [keytree]
  # Deletes a family or specific keytree within a family in the Asterisk database.
  # Returns 1 if successful, 0 otherwise.
  #
  def self.database_deltree(family, keytree=nil)
    self.logger :info, "AGI::database_deltree"    
    cmd = "DATABASE DELTREE #{family.to_s} #{keytree.to_s if keytree}"
    self.exec_command(cmd, DatabaseDeltree)
  end  
end