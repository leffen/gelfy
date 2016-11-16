module GELFY
  # Methods for compatibility with Ruby Logger.
  module LoggerCompatibility

    attr_accessor :formatter

    # Use it like Logger#add... or better not to use at all.
    def add(level, message = nil, progname = nil, &block)
      progname ||= default_options['facility']

      if message.nil?
        if block_given?
          message = yield
        else
          message = progname
          progname = default_options['facility']
        end
      end

      message_hash = { 'facility' => progname }

      if message.is_a?(Hash)
        # Stringify keys.
        message.each do |k,v|
          message_hash[k.to_s] = message[k]
        end
      else
        message_hash['short_message'] = message
      end

      if message.is_a?(Exception)
        message_hash.merge!(self.class.extract_hash_from_exception(message))
      end

      notify_with_level(level, message_hash)
    end

    # Redefines methods in +Notifier+.
    GELFY::Levels.constants.each do |const|
      class_eval <<-EOT, __FILE__, __LINE__ + 1
        def #{const.downcase}(progname = nil, &block)   # def debug(progname = nil, &block)
          add(GELF::#{const}, nil, progname, &block)    #   add(GELF::DEBUG, nil, progname, &block)
        end                                             # end

        def #{const.downcase}?                          # def debug?
          GELF::#{const} >= level                       #   GELF::DEBUG >= level
        end                                             # end
      EOT
    end

    def <<(message)
      notify_with_level(GELFY::UNKNOWN, 'short_message' => message)
    end

  end

  class Logger < Notifier
    include LoggerCompatibility
  end

end
