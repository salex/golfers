module Convert
  class GetGroups
    # attr_accessor :groups #, :json
    def initialize
      json = File.read(Rails.root.join('app','objects','convert','set_groups.json'))
      # puts "JSO Group #{json[0..26]}"
      return(JSON.parse(json))
      # puts @groups.class

    end

  end
end
