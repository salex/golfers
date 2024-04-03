module Convert
  class GetGroups
    attr_accessor :groups, :json
    def initialize
      @json = File.read(Rails.root.join('app','objects','convert','group.json'))
      @groups = JSON.parse(@json)
    end

  end
end
