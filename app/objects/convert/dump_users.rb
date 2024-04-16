module Convert
  class DumpUsers
    attr_accessor :users, :json
    def initialize
      @users = User.all.order(:id).as_json(except: [:updated_at, :created_at])
      @json = []
      @users.each do |u|
        j = {}
        j['id'] = u["id"]
        j['group_id'] = u["group_id"]
        j['username'] = u["username"]
        j['email'] = u["email"]
        j['role'] = get_role
        j['fullname'] = get_name(u["player_id"])
        j['permits'] = nil
        j['password_digest'] = u["password_digest"]
        @json << j
      end
      File.write(Rails.root.join('app','objects','convert','set_users.json'),@json.to_json)
    end
    def get_name(uid)
      # puts uid
      p = Player.find_by_id(uid)
      if p.present?
        return(p.name)
      else
        return  "Unknown"
      end
    end

    def get_role
      old_roles = %w(super coordinator manager scorer scheduler)
      new_roles = %w(super admin trustee member visitor)
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
          return "visitor"
        end
      end
    end

  end
end

# create_table "users", force: :cascade do |t|
#   t.bigint "group_id", null: false
#   t.bigint "player_id"
#   t.string "email"
#   t.string "username"
#   t.text "role"
#   t.string "password_digest"
#   t.string "reset_token"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["group_id"], name: "index_users_on_group_id"
#   t.index ["player_id"], name: "index_users_on_player_id"
# end

# create_table "users", force: :cascade do |t|
#   t.bigint "group_id", null: false
#   t.string "fullname"
#   t.string "username"
#   t.string "email"
#   t.string "role"
#   t.text "permits"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.string "password_digest"
#   t.index ["group_id"], name: "index_users_on_group_id"
# end

