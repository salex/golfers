module Convert
  class GetPlayers
    attr_accessor :players, :json
    def initialize
      @json = File.read(Rails.root.join('app','objects','convert','players.json'))
      @players = JSON.parse(@json)
      @players.each do |p|
        p["id"] = nil
        p["group_id"] = 5
        np = Player.new(p)
        puts np.name
        np.save
      end
    end

  end
end
