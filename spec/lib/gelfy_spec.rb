
module GELFY
  describe GelfLogger do

    it "Should be instansiable " do
      lg = GelfLogger.new(host: 'localhost', port: "12201")
      expect(lg).to be
      logger = lg.logger
      expect(logger).to be


    end

  end
end