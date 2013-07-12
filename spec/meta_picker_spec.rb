require_relative 'spec_helper'

describe MetaPicker, :vcr do
  let(:picker) do
    Faraday.stub_chain(:new, :get, :body)
    MetaPicker.new("http://www.example.com")
  end

  describe "#initialize" do
    it "gets a document" do
      picker.doc.should be_a_kind_of(Nokogiri::HTML::Document)
    end
  end

  describe "#twitter_card" do
    it "gets all twitter meta tags" do
      input = "<meta name='twitter:t_name' content='This is foo'><meta property='twitter:t_property' content='This is bar'>"
      picker.stub(:doc => Nokogiri::HTML(input))
      tc = picker.twitter_card
      tc.t_name?.should eq(true)
      tc.t_property?.should eq(true)
    end

    it "does not include non twitter meta tags" do
      input = "<meta name='foo:foo_name' content='This is foo'>><meta property='foo':foo_property' content='This is bar'>"
      picker.stub(:doc => Nokogiri::HTML(input))
      tc = picker.twitter_card
      tc.foo_name?.should eq(false)
      tc.foo_property?.should eq(false)
    end
  end

  describe "#og_data" do
    it "gets all og meta tags" do
      input = "<meta name='og:og_name' content='This is foo'>><meta property='og:og_property' content='This is bar'>"
      picker.stub(:doc => Nokogiri::HTML(input))
      og = picker.og_data
      og.og_name?.should eq(true)
      og.og_property?.should eq(true)
    end

    it "does not include non og meta tags" do
      input = "<meta name='foo:foo_name' content='This is foo'>><meta property='foo':foo_property' content='This is bar'>"
      picker.stub(:doc => Nokogiri::HTML(input))
      og = picker.og_data
      og.foo_name?.should eq(false)
      og.foo_property?.should eq(false)
    end
  end

  describe "#all_meta" do
    it "gets all meta tags" do
      input = "<meta name='foo:foo' content='This is foo'><meta property='bar:bar' content='This is bar'>"
      picker.stub(:doc => Nokogiri::HTML(input))
      am = picker.all_meta
      am.foo_foo?.should eq(true)
      am.bar_bar?.should eq(true)
    end
  end

  describe "live tests" do
    describe "on vine" do
      let(:pickerv) { MetaPicker.new("https://vine.co/v/b5pDOD23KPH") }
      it "should have a title" do
        pickerv.twitter_card.title.should_not be_nil
      end

      it "should have a description" do
        pickerv.twitter_card.description.should_not be_nil
      end

      it "should be a video" do
        pickerv.twitter_card.player_stream.should_not be_nil
      end
    end

    describe "on instagram" do
      let(:pickeri) { MetaPicker.new("http://instagram.com/p/bowsK3B-3H/") }
      it "should have a title" do
        pickeri.og_data.title.should_not be_nil
      end

      it "should have a description" do
        pickeri.og_data.description.should_not be_nil
      end

      it "should be a video" do
        pickeri.og_data.video.should_not be_nil
      end
    end
  end
end