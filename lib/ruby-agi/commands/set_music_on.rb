
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
  # Usage: SET MUSIC ON <on|off> <class>
 	# Enables/Disables the music on hold generator.  
 	# If <class> is not specified, then the default music on hold class will be used.
  # Always returns 0.
  #
  def self.set_music_on(moh, moh_class=nil)
    self.logger :info, "AGI::set_music"
    cmd = "SET MUSIC ON #{(moh == true or moh.upcase == 'ON') ? 'on' : 'off'} #{moh_class.to_s}"
    self.exec_command(cmd, SetMusicOn)
  end
end
