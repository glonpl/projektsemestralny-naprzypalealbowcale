require_relative '../lib/sudoku.rb'
require_relative '../lib/user_interface.rb'
describe "Testy Wstepne" do
  a= Array.new
  a=[9,5,2,15,8]

  it "czy sortuje" do
    expect(a.sortowanie!).to eq([2,5,8,9,15])
  end
end

describe "Testy poszczegolne" do
  let(:fb) {Array.new}

  it "Instancja klasy" do
    expect(fb).to be_instance_of(Array)
  end

  it "Nil" do
    expect(fb).not_to be(nil)
  end


end
describe "ujemne" do
a= Array.new
a= [5,-11,3,15]
it "Inny wyjatek" do
  expect(a.sortowanie!).to eq([-11,3,5,15])
end
end
describe "znaki" do
  a= Array.new
  a=  ["Zbigniew",1,4]
it "Zbysiu" do
  expect{a.sortowanie}.to raise_error(ArgumentError)
end


end
