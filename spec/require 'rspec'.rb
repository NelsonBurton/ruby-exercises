require 'rspec'
require 'hello'

describe "#hello_world" do
  it "returns 'Hello! and stuff'" do
    expect(hello).to eq("Hell!")
  end
end