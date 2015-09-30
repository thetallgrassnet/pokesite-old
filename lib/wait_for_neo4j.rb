require "logger"
require "open-uri"

module WaitForNeo4j
  def self.logger=(logger)
    @@logger = logger
  end

  # Returns either when connection becomes available or after 30 seconds, whichever comes first
  def self.wait_for(db_path, timeout = 30)
    @@logger ||= Logger.new(STDOUT)
    @@logger.info "Attempting to connect to #{db_path}"
    tries = 0

    begin
      tries += 1
      @@logger.debug "Connection attempt #{tries} to #{db_path}"
      open(db_path)
      @@logger.info "Connection succeeded!"
      return true
    rescue
      @@logger.debug "Connection attempt #{tries} to #{db_path} failed!"
      sleep 1
      retry if tries < timeout
    end

    @@logger.error "Could not connect to #{db_path} in #{timeout} second#{"s" if timeout != 1}"
    return false
  end
end
