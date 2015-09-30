require 'spec_helper'
require 'wait_for_neo4j'

RSpec.describe WaitForNeo4j do
  let(:logger) { instance_double("Logger") }
  before(:each) { WaitForNeo4j.logger = logger }

  context "logger=" do
    it "sets the logger" do
      expect(WaitForNeo4j.class_variable_get(:@@logger)).to eql(logger)
    end
  end

  context "wait_for" do
    let(:db_path) { "http://localhost:7474" }

    before(:each) do
      expect(logger).to receive(:info).with("Attempting to connect to #{db_path}")
      expect(logger).to receive(:debug).with("Connection attempt 1 to #{db_path}")
    end

    it "returns true if connection succeeds" do
      expect(WaitForNeo4j).to receive(:open).with(db_path)

      expect(logger).to receive(:info).with("Connection succeeded!")
      expect(WaitForNeo4j.wait_for db_path).to be true
    end

    it "returns false if connection fails" do
      expect(WaitForNeo4j).to receive(:open).with(db_path).and_raise(Errno::ECONNREFUSED)
      expect(logger).to receive(:debug).with("Connection attempt 1 to #{db_path} failed!")
      expect(WaitForNeo4j).to receive(:sleep).with(1)

      expect(logger).to receive(:error).with("Could not connect to #{db_path} in 1 second")
      expect(WaitForNeo4j.wait_for db_path, 1).to be false
    end
  end
end
