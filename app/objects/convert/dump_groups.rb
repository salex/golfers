module Convert
  class DumpGroups
    attr_accessor :groups, :json
    def initialize
      @groups = Group.all.order(:id).as_json(except: [:updated_at, :created_at, :club_id,:preferences])
      @json = []
      @groups.each do |g|
        j = {}
        j['id'] = g["id"]
        j['name'] = g["name"]
        j['tees'] = g["tees"]
        j['settings'] = g["settings"]
        j['cources'] = {}
        @json << j
      end
      File.write(Rails.root.join('app','objects','convert','group.json'),@json.to_json)
    end
  end
end