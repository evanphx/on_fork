require 'on_fork'

module OnForkShims
  VERSION = "1.0.0"

  SHIMS = []

  def self.add(cond=true, &blk)
    return unless cond
    SHIMS << blk
  end

  def self.register
    SHIMS.each { |s| s.call }
  end
end

require 'on_fork/shims/activerecord'
