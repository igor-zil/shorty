require 'rails_helper'
RSpec.describe Link, type: :model do
  subject { described_class.new }
  it "is not valid without original URL" do
    subject.original = ''
    subject.short = 'http://www.google.com.au'
    expect(subject).to_not be_valid
  end
  it "is not valid without short URL" do
    subject.original = 'http://www.google.com.au'
    subject.short = ''
    expect(subject).to_not be_valid
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
  it "is not valid when short URL is not valid" do
    subject.original = 'http://www.google.com.au'
    subject.short = 'Something'
    expect(subject).to_not be_valid
  end
end
