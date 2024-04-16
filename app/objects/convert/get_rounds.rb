module Convert
  class GetRounds
    attr_accessor :rounds
    def initialize
      json = File.read(Rails.root.join('app','objects','convert','set_rounds.json'))
      @rounds = JSON.parse(json)
    end
  end
end
