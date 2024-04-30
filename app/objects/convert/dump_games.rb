module Convert
  class DumpGames
    attr_accessor :games, :json
    def initialize
      @games = Game.all.order(:id).as_json(except: [:updated_at, :created_at, :state])
      @json = []
      @games.each do |g|
        puts "STATS #{g["stats"]}"
        j = {}
        j['id'] = g["id"]
        j['group_id'] = g["group_id"]
        j['date'] = g["date"]
        j['status'] = g["status"]
        j['method'] = g["method"]
        j['scoring'] = g["stats"]
        j['par3'] = g["par3"]
        j['skins'] = g["skins"]
        @json << j
      end
      File.write(Rails.root.join('app','objects','convert','set_games.json'),@json.to_json)
    end
  end
end

# create_table "games", force: :cascade do |t|
#   t.bigint "group_id", null: false
#   t.date "date"
#   t.string "status"
#   t.string "method"
#   t.text "stats"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.text "skins"
#   t.text "par3"
#   t.index ["group_id"], name: "index_games_on_group_id"
# end
# create_table "games", force: :cascade do |t|
#   t.bigint "group_id", null: false
#   t.date "date"
#   t.string "status"
#   t.string "method"
#   t.text "scoring"
#   t.text "par3"
#   t.text "skins"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["group_id"], name: "index_games_on_group_id"
# end

