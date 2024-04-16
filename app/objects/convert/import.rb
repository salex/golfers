module Convert
  class Import
    attr_accessor :groups, :players, :users, :games, :rounds

    def initialize
      import_groups
      import_players
      import_users
      import_games
      import_rounds
     end

    def import_groups
      json = File.read(Rails.root.join('app','objects','convert','set_groups.json'))
      @groups = JSON.parse(json)

      @groups.each do |g|
        g.delete("courses")
        mid = g['id']
        g.delete("id")

        newm = Group.new

        newm.assign_attributes(g)
        newm.id = mid

        unless newm.valid?
          puts "New group: #{newm.id},is invalid:"
          puts newm.errors.objects.first.full_message
        else
          newm.save
        end
      end
      puts "Groups imported"
    end

    def import_players
      json = File.read(Rails.root.join('app','objects','convert','set_players.json'))
      @players = JSON.parse(json)

      @players.each do |g|
        mid = g['id']
        g.delete("id")

        newm = Player.new
   
        newm.assign_attributes(g)
        newm.id = mid
        unless newm.valid?
          puts "New player: #{newm.id},is invalid:"
          puts newm.errors.objects.first.full_message
        else
          newm.save
        end
      end
      puts "Players imported"

    end

    def import_users
      json = File.read(Rails.root.join('app','objects','convert','set_users.json'))
      @users = JSON.parse(json)

      @users.each do |g|
        mid = g['id']
        g.delete("id")

        newm = User.new

        newm.assign_attributes(g)
        newm.id = mid
        unless newm.valid?
          puts "New user: #{newm.id},is invalid:"
          puts newm.errors.objects.first.full_message
        else
          newm.save
        end
      end
      puts "users imported"

    end

    def import_games
      json = File.read(Rails.root.join('app','objects','convert','set_games.json'))
      @games = JSON.parse(json)

      @games.each do |g|
        mid = g['id']
        g.delete("id")

        newm = Game.new

        newm.assign_attributes(g)
        newm.id = mid
        unless newm.valid?
          puts "New game: #{newm.id},is invalid:"
          puts newm.errors.objects.first.full_message
        else
          newm.save
        end

      end
      puts "games imported"


    end

    def import_rounds
      json = File.read(Rails.root.join('app','objects','convert','set_rounds.json'))
      @rounds = JSON.parse(json)

      @rounds.each do |g|
        mid = g['id']
        g.delete("id")

        newm = Round.new

        newm.assign_attributes(g)
        newm.id = mid
        unless newm.valid?
          puts "New round: #{newm.id},is invalid:"
          puts newm.errors.objects.first.full_message
        else
          newm.save
        end
      end
      puts "rounds imported"

    end
  end

end
