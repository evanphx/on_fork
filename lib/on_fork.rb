class OnForkManager
  VERSION = "1.0.0"

  def initialize
    @lock = Mutex.new
    @hooks = []
    @advise = false
  end

  attr_accessor :advise

  def add(&hook)
    @lock.synchronize do
      @hooks << hook
    end
  end

  RealFork = Process.method(:fork)

  def fork(*args, &blk)
    @hooks.dup.each do |h|
      h.call
    end

    advise if @advise

    RealFork.call(*args, &blk)
  end

  def advise
    ObjectSpace.each_object(IO) do |obj|
      if obj.respond_to? :peeraddr
        begin
          ary = obj.peeraddr
          $stderr.puts "on_fork: Detected open socket to #{ary[3]}:#{ary[1]} at fork"
        rescue Exception
          $stderr.puts "on_fork: Detected open IO at fork: #{obj}"
        end
      end
    end
  end

  def patch!
    Kernel.module_eval do
      undef_method :fork

      def fork(*args, &blk)
        OnFork.fork(*args, &blk)
      end

      module_function :fork
    end

    class << Process
      undef_method :fork

      def fork(*args, &blk)
        OnFork.fork(*args, &blk)
      end
    end
  end
end

OnFork = OnForkManager.new

OnFork.patch! unless ENV['ON_FORK_NO_PATCH']
OnFork.advise = ENV.key?("ON_FORK_ADVISE")
