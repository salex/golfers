module Convert
  class GetPlayers
    attr_accessor :players
    def initialize
      json = File.read(Rails.root.join('app','objects','convert','set_players.json'))
      # puts "JSO Player #{json[0..26]}"
      @players = JSON.parse(json)
      # puts @players.class
      # @players.each do |p|
      #   p["id"] = nil
      #   p["group_id"] = 5
      #   np = Player.new(p)
      #   puts np.name
      #   np.save
      # end
    end

  end
end
