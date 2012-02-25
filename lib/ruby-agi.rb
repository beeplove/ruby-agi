require 'ruby-agi/exceptions'
require 'ruby-agi/agi.rb'
require 'ruby-agi/commands.rb'
require 'ruby-agi/return_status.rb'

['commands', 'return_status'].each do | s |
  dir = File.join(File.dirname(__FILE__), 'ruby-agi', s)
  Dir.entries(dir).each do | f |
    filename = File.join(dir, f)
    begin
      require filename if File.file?(filename)
    rescue
      $stderr.puts "Failed to 'require #{filename}'"
    end
  end
end


