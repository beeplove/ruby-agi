
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
  # Usage: SET EXTENSION <new extension>
 	# Changes the extension for continuation upon exiting the application.
  #
  def self.set_extension(new_extension)
    self.logger :info, "AGI::set_extension"
    cmd = "SET EXTENSION #{new_extension.to_s}"
    self.exec_command(cmd, SetExtension)
  end
end
