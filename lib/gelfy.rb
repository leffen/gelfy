require 'json'
require 'socket'
require 'zlib'
require 'digest/md5'


require 'gelfy/severity'
require 'gelfy/notifier'
require 'gelfy/logger'

module GELFY
  module Protocol
    UDP = 0
    TCP = 1
    RABBIT = 2
    REDIS = 3
  end
end

module GELFY

  class GelfLogger

    def initialize(*args)
      @args = *args
    end

    def logger
      Thread.current[:logger] ||= ::GELFY::Logger.new(*@args)
    end

    private

    def pid
      ::Process.pid
    end

    def tid
      ::Thread.current.object_id.to_s(36)
    end

    def context
      ::Thread.current[:sidekiq_context]
    end


    def filter_fields(data)
      data.each do |key, val|
        if val.is_a?(String) && val.length > 32766 # max message length
          data[key] = "[omitted; length = #{val.length}, max = 32766]"
        end
      end

      data
    end
  end

end
