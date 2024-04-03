module Convert
  class DumpUsers
    attr_accessor :users, :json
    def initialize
      @users = User.all.order(:id).as_json(except: [:updated_at, :created_at])
      @json = []
      @users.each do |u|
        j = {}
        j['id'] = u["id"]
        j['username'] = u["username"]
        j['email'] = u["email"]
        j['role'] = get_role
        j['fullname'] = get_name(u["player_id"])
        j['permits'] = nil
        j['password_digest'] = u["password_digest"]
        @json << j
      end
      File.write(Rails.root.join('app','objects','convert','user.json'),@json.to_json)
    end
    def get_name(uid)
      puts uid
      p = Player.find_by_id(uid)
      if p.present?
        puts p.name
        return(p.name)
      else
        return  "Unknown"
      end
    end

    def get_role
      old_roles = %w(super coordinator manager scorer scheduler)
      new_roles = %w(super admin trustee member guest)
      old_roles.each_with_index do |old,i|
        if old == 'super'
          return new_roles[i]  
        elsif old == 'coordinator'
          return new_roles[i] 
        elsif old == 'manager'
          return new_roles[i] 
        elsif old == 'scorer'
          return new_roles[i] 
        else
          return "guses"
        end
      end
    end

  end
end