#Gameboard-plansza gry, w pliku,który można załadować
#Players-klasa
#Leaderboard-plik, lista nazwa.gracz ilośćzwyciestw najwyzszywynik
#TileBag-tabelka z ilośćią klocków, wartością punktową
 
class Game
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


