require 'sync'
require 'digest'
require 'logger'
require 'thread'


module AGI
  
  class << self
    @@session     = Digest::SHA1.hexdigest(Time.now.to_f.to_s)
    
    $stderr.sync  = true if not $stderr.sync
    $stdout.sync  = true if not $stdout.sync
    $stdin.sync   = true if not $stdin.sync
    
    @@mutex       = Mutex.new    
    @@env         = Hash.new
    
    begin
      @@logger      = Logger.new("/var/log/ruby-agi/message") 
    rescue Errno::EACCES => e
      @@logger = nil
      $stderr.puts "Log will not be produced (#{e.message})"
    rescue
      raise
    end
  end

  private
  def self.exec_command(cmd, rs)
    responses = nil
    
    begin
      lines     = []
        
      thread = Thread.new do
        @@mutex.synchronize do
          if @@env.empty?
            $stdin.each_line do | line |
              break if line.nil? or line.strip.to_s.size.zero?
              lines << line
            end
          end
        end
      end    
     
      flag = true
      begin
        self.logger :info, "thread.run : #{thread.status}"
        thread.run
      rescue ThreadError => e
        self.logger :info, "ThreadError occured, #{e.message}"
        flag = false
        retry if flag  
      rescue
        raise
      end
    
      flag  = true
      count = 0
      s     = 0
      
      while flag
        if thread.alive?
          count = count + 1
          self.logger :info, "main thread going to sleep for #{count} seconds while waiting for thread"
          if count >= 5
            flag = false
            thread.kill
            self.logger :warn, "Killed thread after waiting for #{s} seconds"
            raise AGIError, "Timeout to populate @@env" 
          else
            s = s + (sleep count)
          end
        else
          flag = false
        end
      end
      
      lines.each do | line |
        line.strip!
        break if line.nil? or line.strip.size.zero?
        key, value = line.split(': ')
        @@env[key] = value
        self.logger :info, "#{key} => #{value}"        
      end
    
      @@mutex.synchronize do
        $stdout.puts cmd
        responses = $stdin.gets.strip
      end
    
      self.logger :info, "<< #{cmd}"  
      self.logger :info, ">> #{responses}"
    rescue Errno::EPIPE
      self.logger :info, "Hung up by user"
    rescue
      raise
    end
    
    return ReturnStatus.return_status(cmd, responses, rs)
  end
  
  private 
  def self.logger(level, message)
    if @@logger
      message = [@@session, Time.now.strftime("%Y-%m-%d %H:%M:%S"), message].join(" ")
      @@logger.send level, message
    end
  end
  
end
