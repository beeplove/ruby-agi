
module AGI

  #
  # Usage: EXEC <application> <options>
 	# Executes <application> with given <options>.
  # Returns whatever the application returns, or -2 on failure to find application
  #
  def self.exec(application, options=nil)
    self.logger :info, "AGI::exec"
    cmd = "EXEC #{application.to_s} #{options.to_s}"
    self.exec_command(cmd, Exec)
  end
end
