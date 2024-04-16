module Convert
  class GetGames
    attr_accessor :games, :json
    def initialize
      @json = File.read(Rails.root.join('app','objects','convert','set_games.json'))
      @games = JSON.parse(@json)
    end
  end
end
