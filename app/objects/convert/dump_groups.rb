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
        j['courses'] = ''
        @json << j
      end
      File.write(Rails.root.join('app','objects','convert','set_groups.json'),@json.to_json)
    end
  end
end
# create_table "groups", force: :cascade do |t|
#   t.bigint "club_id", null: false
#   t.string "name"
#   t.string "tees"
#   t.text "preferences"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.text "settings"
#   t.index ["club_id"], name: "index_groups_on_club_id"
# end
# create_table "groups", force: :cascade do |t|
#   t.string "name"
#   t.string "tees"
#   t.text "settings"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.text "courses"
# end

