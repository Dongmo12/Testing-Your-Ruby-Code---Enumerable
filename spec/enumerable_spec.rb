require './lib/enumerable.rb'

RSpec.describe Enumerable do
    let(:arr1){[1,2,3]}
    let(:arr2){[1,2,3,4,5,6]}
    let(:arr3){[1,2,3,10]}
 
    describe '#my_each' do

        it "executes the block on each element in an array" do
                result = []
                arr1.my_each { |i| result << i+1 }
                expect(result).to eql([2,3,4])
        end
    end

    describe "#my_each_index " do
        it "interates through each element with index" do
            test = []
            arr2.my_each_index { |x, i| test << x << i }
            expect(test).to eql([1,0,2,1,3,2,4,3,5,4,6,5])
        end
    end
    describe "#my_select" do
        it "interates through and selects on condition" do             
            test = arr2.my_select { |x| x > 3 }
            expect(test).to eql([4,5,6])
        end
    end
    describe "#my_all?" do
        it "interates through and checks for all condition met" do
            expect(arr2.my_all? { |x| x < 7 }).to eql(true)
        end
    end

    describe "#my_any?" do
        it "interates through and checks for any condition met true" do
            expect(arr2.my_any? { |x| x == 6 }).to eql(true)
        end

        it "interates through and checks for any condition met false" do
            expect(arr2.my_any? { |x| x == 7 }).to eql(false)
        end
    end

    describe "#my_none?" do
        it "interates through and checks for no condition met" do
            expect(arr2.my_none? { |x| x > 7 }).to eql(true)
        end
    end

    describe "#my_count" do
        it "interates through and counts num items meet condition" do
            expect(arr2.my_count { |x| x > 3 }).to eql(3)
        end
    end

    describe "#my_inject" do
        it "correctly passes forward sum of calculation" do
            expect(arr2.my_inject { |sum, x| sum * x }).to eql(720)
        end
    end

    describe "#my_map?" do
        it "Returns a new array of elements with the block applied to each element" do           
          expect(arr3.my_map{|n| n+=5}).not_to eq([false, false, false, false])
        end
      end
end