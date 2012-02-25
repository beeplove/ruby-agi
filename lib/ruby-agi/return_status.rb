
# ToDo: escape special characters like single quote, double qutoe
class ReturnStatus
  include Comparable
  
  def initialize(cmd, responses)
    @cmd = cmd
    @responses = responses
  end
  
  def inspect
    ">> #{@cmd} << #{@responses}"
  end
  
  def self.return_status(cmd, responses, rs)
    rs.new(cmd, responses)
  end
end
