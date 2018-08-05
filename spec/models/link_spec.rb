require 'rails_helper'
RSpec.describe Link, type: :model do
  subject {described_class.new}
  it "uses record id encoded with no short" do
    url = 'http://www.google.com.au/#'
    urltemp =''
    coded_id = 'a'
    value = 1
    10.times do
      urltemp = url.gsub("#",value.to_s)
      value+=1
      Link.create original: urltemp
    end
    link = Link.find_by original: urltemp
    shrt = link.get_shorty
    expect(shrt).to eq(coded_id)
    expect(link.custom?).to eq("generated")
  end
  it "uses short when present" do
     short  = 'PrivetTimofei'
     url = 'http://www.google.com.au'
     Link.create original: url, short: short
     link = Link.find_by original: url
     shrt = link.get_shorty
     expect(shrt).to eq(short)
     expect(link.custom?).to eq("custom")
   end
  it "is not valid without original URL" do
    subject.original = ''
    subject.short = 'http://www.google.com.au'
    expect(subject).to_not be_valid
  end
  it "is valid without short URL" do
    subject.original = 'http://www.google.com.au'
    subject.short = ''
    expect(subject).to be_valid
  end
  it "is valid with valid attributes" do
    subject.original = 'http://www.google.com.au'
    subject.short = 'http://ormondseniors.net.au'
    expect(subject).to be_valid
  end
  it "is not valid when original URL is not valid" do
    subject.original = 'Something'
    subject.short = 'http://www.google.com.au'
    expect(subject).to_not be_valid
  end
  it "is valid when short URL is null" do
    subject.original = 'http://www.google.com.au'
    subject.short = nil
    expect(subject).to be_valid
  end
  it "is valid when short URL is not null" do
    subject.original = 'http://www.google.com.au'
    subject.short = "12"
    expect(subject).to be_valid
  end
end
