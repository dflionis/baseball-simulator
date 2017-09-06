class Season < ApplicationRecord
  has_many :games, dependent: :destroy

  enum status: [:scheduled, :in_progress, :final]

  validates :name, presence: true

  after_initialize :set_default_values

  def play!
    puts "starting season..."
    self.update(status: Season.statuses[:in_progress])
    games.each { |g| g.play! }
    self.update(status: Season.statuses[:final])
    puts "season complete!"
  end

  def report!
    print_standings
    print_avg_leaders
    %w(h rbi bb so doubles triples hr).each do |stat|
      print_stat_leaders(stat)
    end
    nil
  end

  private

  def set_default_values
    self.status ||= Season.statuses[:scheduled]
  end

  def print_standings
    standings = {}
    teams = []
  
    games.map { |g| g.home_team }.uniq.each do |team|
      teams << team
      standings[team.id] = { w: 0, l: 0 }
    end

    teams.each do |team|
      games.where("away_team_id = #{team.id} OR home_team_id = #{team.id}").each do |game|
        if game.away_team_id == team.id
          if game.away_score > game.home_score
            standings[team.id][:w] += 1
          else
            standings[team.id][:l] += 1
          end
        else
          if game.home_score > game.away_score
            standings[team.id][:w] += 1
          else
            standings[team.id][:l] += 1
          end
        end
      end
    end

    puts "|---- Team -------|-W-|-L-|-Pct-|"
    puts "|-----------------|---|---|-----|"
    standings.sort_by { |_team, record| record[:l] }.each do |team_id, record|
      print Team.find(team_id).name
      print "|"
      print record[:w] 
      print "|"
      print record[:l] 
      print "|"
      print (record[:w] / (record[:w] + record[:l]).to_f).round(3).to_s[1..-1]
      puts "|"
    end
    nil
  end

  def print_stat_leaders(stat)
    return false if stat.include?(";")

    sql = %(
      SELECT
        p.id,
        p.first_name,
        p.last_name,
        t.name AS team,
        SUM(gls.#{stat}) AS #{stat}
      FROM game_lineup_slots gls
        JOIN games g ON gls.game_id = g.id
        JOIN seasons s ON g.season_id = s.id
        JOIN players p ON gls.player_id = p.id
        JOIN teams t ON p.team_id = t.id
      GROUP BY p.id, p.first_name, p.last_name, t.name
      ORDER BY #{stat} DESC
      LIMIT 10;
    ).squish

    puts ActiveRecord::Base.connection.execute(sql).to_a
  end  

  def print_avg_leaders
    sql = %(
      SELECT
        p.id,
        p.first_name,
        p.last_name,
        t.name AS team,
        ROUND(SUM(gls.h) * 1.0 / SUM(gls.ab), 3) AS avg
      FROM game_lineup_slots gls
        JOIN games g ON gls.game_id = g.id
        JOIN seasons s ON g.season_id = s.id
        JOIN players p ON gls.player_id = p.id
        JOIN teams t ON p.team_id = t.id
      GROUP BY p.id, p.first_name, p.last_name, t.name
      ORDER BY avg DESC
      LIMIT 10;
    ).squish

    puts ActiveRecord::Base.connection.execute(sql).to_a
  end
end
