require './unique_list.rb'
require 'rspec'

describe 'UniqueList' do
  let(:list) { UniqueList.new }

  it 'has a default value of an empty array' do
    expect(list.values).to eq([])
  end

  describe 'add' do
    it 'should add a number to the list' do
      list.add(5)
      expect( list.values ).to eq([5])
    end

    it 'should not add the same value twice' do
      list.add(5)
      list.add(5)
      expect( list.values ).to eq([5])
    end
  end

  describe 'remove' do
    it 'should be a no-op when the value is not in the list' do
      list.remove(5)
      # no error raised
    end

    it 'should remove a value that exists at the head of the list' do
      list.add(5)
      list.add(6)
      list.remove(5)
      expect(list.values).to eq([6])
    end

    it 'should remove a value that exists at the tail of the list' do
      list.add(5)
      list.add(6)
      list.remove(6)
      expect(list.values).to eq([5])
    end

    it 'should remove a value that exists between two other values' do
      list.add(5)
      list.add(6)
      list.add(7)
      list.remove(6)
      expect( list.values ).to eq([5,7])
    end
  end

  describe 'find' do
    it 'should return nil when a matching node is not found' do
      expect( list.find(11) ).to be_nil
    end

    it 'should return the node with the expected value' do
      list.add(11)
      expect( list.find(11).value).to eq(11)
    end
  end
end
