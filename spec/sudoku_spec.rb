require_relative '../lib/sudoku.rb'

RSpec.describe "Sudoku" do
    describe '#initalize' do
        let(:good_input) { "530070000600195000098000060800060003400803001700020006060000280000419005000080079"}
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
    end
end
