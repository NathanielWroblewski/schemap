require 'spec_helper'
require './bin/schemap'

describe Dog, '#bark' do
  it 'displays woof' do
    dog = Dog.new
    expect(dog.bark).to eq 'woof'
  end
end
