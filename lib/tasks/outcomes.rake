namespace :outcomes do
  desc "List all possible outcomes"
  task :list_all => :environment do
    puts all_possible_outcomes
  end

  desc "List all undocumented possible outcomes"
  task :list_undocumented => :environment do
    puts "Here are the possible outcomes the system does not recognize..."
    puts (all_possible_outcomes - Outcome.all.collect(&:code)).sort
  end

  def all_possible_outcomes
    outcomes = []
    classes = [Player, Pitcher]
    hitter_matchup_columns = [:vs_lhp, :vs_rhp]
    pitcher_matchup_columns = [:vs_lhb, :vs_rhb]

    classes.each do |klass|
      klass.all.each do |p|
        matchup_columns = klass == Player ? hitter_matchup_columns : pitcher_matchup_columns
        matchup_columns.each do |vs_x|
          p.send(vs_x).each do |white_die, red_dice|
            red_dice.each do |red_die, unnested_outcome|
              if unnested_outcome.is_a?(String)
                outcomes << unnested_outcome
              else
                unnested_outcome.each do |range, nested_outcome|
                  outcomes << nested_outcome
                end
              end
            end
          end
        end
      end
    end

    outcomes.uniq.sort
  end
end
