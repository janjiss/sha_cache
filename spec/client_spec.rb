require "spec_helper"

module ShaCache::Adapter
  class Test
  end
end

describe ShaCache::Client do
  context "Null adapter" do
    it "raises errror if adapter is not configured" do
      expect {ShaCache::Client.has_data?("key", "value")}.to raise_error
    end
  end

  context "Test adapter" do
    before(:each) do
      @adapter = ShaCache::Adapter::Test
      ShaCache::Config.config do |c|
        c.adapter = @adapter
      end
    end

    subject { ShaCache::Client }

    it "writes data and converts it's contents to sha" do
      body = "response from 3rd pary API"
      body_sha = convert_to_sha(body)
      expect(@adapter).to receive(:write_data).with("key", body_sha)
      subject.write_data("key", body)
    end

    it "checks if data has allready been used and returns true if it was" do
      body = "response from 3rd pary API"
      body_sha = convert_to_sha(body)
      expect(@adapter).to receive(:get_data_by_key).with("key").and_return(body_sha)
      expect(subject.data_was_used?("key", body)).to be_true
    end

    it "checks if data has allready been used and returns false if it was not" do
      body = "response from 3rd pary API"
      body_sha = convert_to_sha(body)
      expect(@adapter).to receive(:get_data_by_key).with("key").and_return("other_sha_retured")
      expect(subject.data_was_used?("key", body)).to be_false
    end
  end
end
