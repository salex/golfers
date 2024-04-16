module Convert
  class DumpPlayers
    attr_accessor :players, :json
    def initialize
      @players = Player.all.order(:id).as_json(except: [:updated_at, :created_at])
      # players are the same
      # @json = []
      # @players.each do |g|
      #   j = {}
      #   j['id'] = g["id"]
      #   j['group_id'] = g["group_id"]
      #   j['first_name'] = g["first_name"]
      #   j['last_name'] = g["tees"]
      #   j['nickname'] = g["nickname"]
      #   j['use_nickname'] = g["use_nickname"]
      #   j['name'] = g["name"]
      #   j['tee'] = g["tee"]
      #   j['quota'] = g["quota"]
      #   j['rquota'] = g["rquota"]
      #   j['phone'] = g["phone"]
      #   j['last_played'] = g["last_played"]
      #   j['is_frozen'] = g["is_frozen"]
      #   j['pin'] = g["pin"]
      #   j['limited'] = g["limited"]
      #   @json << j
      # end
      #File.write(Rails.root.join('app','objects','convert','player.json'),@json.to_json)
      File.write(Rails.root.join('app','objects','convert','set_players.json'),@players.to_json)
    end
  end
end
# create_table "players", force: :cascade do |t|
#   t.bigint "group_id", null: false
#   t.string "first_name"
#   t.string "last_name"
#   t.string "nickname"
#   t.boolean "use_nickname"
#   t.string "tee"
#   t.integer "quota"
#   t.float "rquota"
#   t.string "phone"
#   t.boolean "is_frozen"
#   t.date "last_played"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.string "name"
#   t.integer "pin"
#   t.string "limited"
#   t.index ["group_id"], name: "index_players_on_group_id"
# end

# create_table "players", force: :cascade do |t|
#   t.bigint "group_id", null: false
#   t.string "first_name"
#   t.string "last_name"
#   t.string "nickname"
#   t.boolean "use_nickname"
#   t.string "name"
#   t.string "tee"
#   t.integer "quota"
#   t.float "rquota"
#   t.string "phone"
#   t.boolean "is_frozen"
#   t.date "last_played"
#   t.integer "pin"
#   t.string "limited"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["group_id"], name: "index_players_on_group_id"
# end

