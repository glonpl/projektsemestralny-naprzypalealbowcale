require_relative '../lib/sudoku.rb'

RSpec.describe "Sudoku" do
    let(:good_input) { "530070000600195000098000060800060003400803001700020006060000280000419005000080079"}
    subject(:sudoku) {Sudoku.new good_input}

    describe '#initalize' do
        let(:too_short_input) { "4321210013423" }
        
        it 'create a new good instance of sudoku' do
            game = Sudoku.new(good_input)
            expect { game }.not_to raise_error
        end

        it 'returns Sudoku type' do
            game = Sudoku.new(good_input)
            allow(game).to receive(:kind_of?).and_return(Sudoku)
            expect(game).to be_kind_of(Sudoku)
        end

        it 'raise error if not enough parameters' do
            expect{ Sudoku.new }.to raise_error(ArgumentError)
        end

        it 'returns an array of 9 nested arrays which represents each row' do
            rows = [
                [5,3,0,0,7,0,0,0,0],
                [6,0,0,1,9,5,0,0,0],
                [0,9,8,0,0,0,0,6,0],
                [8,0,0,0,6,0,0,0,3],
                [4,0,0,8,0,3,0,0,1],
                [7,0,0,0,2,0,0,0,6],
                [0,6,0,0,0,0,2,8,0],
                [0,0,0,4,1,9,0,0,5],
                [0,0,0,0,8,0,0,7,9]
            ]
            expect(sudoku.instance_variable_get(:@array_of_rows)).to eq(rows)
        end
    end

    describe '#get_row' do
        it 'returns first row' do
            expect(sudoku.get_row(0)).to eq([5,3,0,0,7,0,0,0,0])
        end

        it 'returns middle row' do
            expect(sudoku.get_row(4)).to eq([4,0,0,8,0,3,0,0,1])
        end

        it 'returns last row' do
            expect(sudoku.get_row(8)).to eq([0,0,0,0,8,0,0,7,9])
        end
    end

    describe '#get_column' do
        it 'returns first column' do
            expect(sudoku.get_column(0)).to eq([5,6,0,8,4,7,0,0,0])
        end

        it 'returns middle column' do
            expect(sudoku.get_column(4)).to eq([7,9,0,6,0,2,0,1,8])
        end

        it 'returns last column' do
            expect(sudoku.get_column(8)).to eq([0,0,0,3,1,6,0,5,9])
        end
    end
    

end
