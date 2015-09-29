require "open-uri"
require "socket"

module WaitForNeo4j
  # Returns either when connection becomes available or after 30 seconds, whichever comes first
  def self.wait_for(db_path, timeout = 30)
    tries = 0
    begin
      tries += 1
      print "Connection attempt #{tries} for #{db_path}..."
      open(db_path)
      print "succeeded!\n"
    rescue
      system "sleep 1"
      print "failed!\n"
      retry if tries < timeout
    end
  end
end
