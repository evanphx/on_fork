require 'securerandom'
require 'pathname'
require 'timeout'

class SpawnHelper

  attr_accessor :path, :log, :pid

  def initialize(path, options = {})
    @path = fixture_path(path)
    @log  = options[:log]  || new_log_file
    @env  = options[:env]  || {}
  end

  def wait(regex = %r{booted}, timeout = 30)
    Timeout::timeout(timeout) do
      until log.read.match regex
        sleep 1
      end
    end
    sleep 1
    self
  rescue Timeout::Error
    puts "Timeout waiting for #{regex.inspect} in \n#{log.read}"
    false
  end

  def cleanup
    shutdown
    FileUtils.remove_entry_secure log
  end

  def shutdown
    if pid
      Process.kill('TERM', pid)
      Process.wait(pid)
    end
  rescue Errno::ESRCH
  end

  def spawn
    FileUtils.mkdir_p(log.dirname)
    FileUtils.touch(log)
    env_string = @env.map {|key, value| "#{key}=#{value}" if value }.join(" ")
    @pid = Process.spawn("exec env #{env_string} bundle exec ruby #{path} > #{log}")
    self
  end

  def new_log_file
    Pathname.new("test/logs/").join("spawn_helper_#{SecureRandom.hex(10)}_#{Time.now.to_f}.log")
  end

  def fixture_path(name = nil)
    path = Pathname.new(File.expand_path("../fixtures", __FILE__))
    return path.join(name) if name
    path
  end
end
