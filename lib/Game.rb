#Gameboard-plansza gry, w pliku,który można załadować
#Players-klasa
#Leaderboard-plik, lista nazwa.gracz ilośćzwyciestw najwyzszywynik
#TileBag-tabelka z ilośćią klocków, wartością punktową

class Game

def pointstable{

  "A"=>1, "B"=>3, "C"=>3, "D"=>2, "E"=>1, "F"=>4, "G"=>2, "H"=>4, "I"=>1, "J"=>8,
  "K"=>5, "L"=>1, "M"=>3, "N"=>1, "O"=>1, "P"=>3, "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
  "U"=>1, "V"=>4, "W"=>4, "X"=>8, "Y"=>4, "Z"=>10

 }

end

def spell(word)
    if word == nil
      spacebar = ''
    else
      spacebar = word.upcase.split("")
    end
end

def score(char)
    score = pointstable[char]
end

	def setupplayers
	 puts "How many players?"
	 nrofplayers = get_int_input

#addplayers po podaniu imion nrofplayersrazy
	 players = []
	 puts "Type in player names:"
      	 nrofplayers.times do |player|
	 	puts "What is the \##{player + 1} player name?"
	 	gamer=gets.chomp
		addplayer(gamer)
	 end
return players
end
end

def addplayer(nick)
#gdzies check czy juz nie istnieje
@nick=nick
#zapiszdoplikuleaderboards
end
