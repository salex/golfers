module Convert
  class GetUsers
    attr_accessor :users, :json
    def initialize
      @json = File.read(Rails.root.join('app','objects','convert','set_users.json'))
      @users = JSON.parse(@json)
    end

  end
end
