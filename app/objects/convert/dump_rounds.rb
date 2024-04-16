module Convert
  class DumpRounds
    attr_accessor :rounds, :json
    def initialize
      @rounds = Round.all.order(:id).as_json(except: [:updated_at, :created_at,:front_net, :back_net, :total_net, :player_name])
      # for some reason round.type was not included1!!
      # rounds are the same
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
      File.write(Rails.root.join('app','objects','convert','set_rounds.json'),@rounds.to_json)
    end
  end
end
# create_table "rounds", force: :cascade do |t|
#   t.bigint "game_id", null: false
#   t.bigint "player_id", null: false
#   t.string "type"
#   t.date "date"
#   t.integer "team"
#   t.string "tee"
#   t.integer "quota"
#   t.integer "front"
#   t.integer "back"
#   t.float "quality"
#   t.float "skins"
#   t.float "par3"
#   t.float "other"
#   t.string "limited"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.integer "total"
#   t.index ["game_id"], name: "index_rounds_on_game_id"
#   t.index ["player_id"], name: "index_rounds_on_player_id"
# end
# create_table "rounds", force: :cascade do |t|
#   t.bigint "game_id", null: false
#   t.bigint "player_id", null: false
#   t.string "type"
#   t.date "date"
#   t.integer "team"
#   t.string "tee"
#   t.integer "quota"
#   t.integer "front"
#   t.integer "back"
#   t.integer "total"
#   t.float "quality"
#   t.float "skins"
#   t.float "par3"
#   t.float "other"
#   t.string "limited"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["game_id"], name: "index_rounds_on_game_id"
#   t.index ["player_id"], name: "index_rounds_on_player_id"
# end
