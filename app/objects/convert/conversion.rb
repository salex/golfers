module Convert
  class Conversion
    def initialize
      DumpGroups.new
      DumpPlayers.new
      DumpUsers.new
      DumpGames.new
      DumpRounds.new
    end
  end

  # After import need to reset the pg sequence
  # ActiveRecord::Base.connection.tables.each do |t|
  #   ActiveRecord::Base.connection.reset_pk_sequence!(t)
  # end
  
end

