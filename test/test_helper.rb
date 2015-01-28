require "minitest/autorun"
require "on_fork"

require 'spawn_helper'

lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
