module AGI
  
  #
  # Usage: SET VARIABLE <variablename> <value>
  #
  def self.set_variable(name, value)
    self.logger :info, "AGI::set_variable"    
    cmd = "SET VARIABLE #{name.to_s} #{value.to_s}"
    rs = self.exec_command(cmd, SetVariable)
    #self.logger :info, rs
    rs
  end  
end