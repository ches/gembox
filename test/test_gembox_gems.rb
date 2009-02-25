require 'test_helper'

describe 'Gembox::Gems' do

  describe '#load' do
    before do
      Gembox::Gems.load
    end

    should "load local gems" do
      Gembox::Gems.local_gems.should.be.an instance_of(Hash)
    end

    should "load source index into source_index" do
      Gembox::Gems.source_index.should.be.an instance_of(Gem::SourceIndex)
    end
  end

  describe "#local_gems" do
    before do
      Gembox::Gems.load
      @gems = Gembox::Gems.local_gems
    end

    should "return hash of gems" do
      @gems.should.be.an instance_of(Hash)
    end

    should "only have one entry per gem" do
      @gems.should.has_key? 'sinatra'
      @gems.should.not.has_key? 'sinatra-0.9.0.5'
    end

    should "have an array of spec versions per gem name" do
      @gems['sinatra'].should.be.an instance_of(Array)
      @gems['sinatra'].first.should.be.an instance_of(Gem::Specification)
    end
  end

end