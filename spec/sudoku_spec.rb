require_relative '../lib/sudoku.rb'

RSpec.describe "Sudoku" do
    let(:good_input) { "530070000600195000098000060800060003400803001700020006060000280000419005000080079"}
    let(:hard_input) { "516849732307605000809700065135060907472591006968370050253186074684207500791050608"}
    subject(:sudoku) {Sudoku.new good_input}

    describe '#initalize' do
        let(:too_short_input) { "4321210013423" }
        let(:long_input) { "53007000060019500009800006080006000340080300170002000606000028000041900500008007931231321"}
        let(:row_input) { "530370000600195000098000060800060003400803001700020006060000280000419005000080079"}
        let(:col_input) { "530070000600195000098000060800060003600803001700020006060000280000419005000080079"}
        let(:box_input) { "530070000600195000398000060800060003400803001700020006060000280000419005000080079"}
        
        context "Correct initalization" do
        
            it 'create a new good instance of sudoku' do
                game = Sudoku.new(good_input)
                expect { game }.not_to raise_error
            end

            it 'returns Sudoku type' do
                game = Sudoku.new(good_input)
                allow(game).to receive(:kind_of?).and_return(Sudoku)
                expect(game).to be_kind_of(Sudoku)
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

        context "Wrong initalization" do
            it 'raise error if not enough parameters' do
                expect{ Sudoku.new }.to raise_error(ArgumentError)
            end

            it 'raise error if too long parameter' do 
                expect{ Sudoku.new(long_input) }.to raise_error(ArgumentError)
            end

            it 'raise error if too short parameter' do 
                expect{ Sudoku.new(too_short_input) }.to raise_error(ArgumentError)
            end

            it 'raise error if repeated values in columns' do
                expect{ Sudoku.new(col_input) }.to raise_error(ArgumentError, "Repetition in column")                
            end

            it 'raise error if repeated values in rows' do
                expect{ Sudoku.new(row_input) }.to raise_error(ArgumentError, "Repetition in row")                
            end

            it 'raise error if repeated values in box' do
                expect{ Sudoku.new(box_input) }.to raise_error(ArgumentError, "Repetition in box")                
            end
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

    describe '#nine_box_grid' do
      it 'returns first box_array' do
        expect(sudoku.nine_box_grid(1,1)).to match_array([5,3,0,6,0,0,0,9,8])
      end

      it 'returns last box array' do
        expect(sudoku.nine_box_grid(7,7)).to match_array([2,8,0,0,0,5,0,7,9])
      end 

      it 'returns nil array for out ouf bounds' do
        expect(sudoku.nine_box_grid(5,15)).to match_array([nil,nil,nil,nil,nil,nil,nil,nil,nil])
      end
    end

    describe '#sudoku_solve!' do
      it 'solve puzzle' do
            sudoku.sudoku_solve!
            result = sudoku.instance_variable_get(:@array_of_rows)
            expect(result.flatten).not_to include(0) 
      end

    #   it 'do not solve unsolvable' do
    #       game = Sudoku.new(hard_input)
    #       game.sudoku_solve!
    #       result = game.instance_variable_get(:@array_of_rows)
    #       expect(result.flatten).not_to include(0) 
    #   end
    end
    
    

end
