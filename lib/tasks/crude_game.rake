namespace :crude_game do
  desc "First attempt at a full game to flush out necessary classes, etc"
  task :sox_vs_yanks => :environment do
    game = create_new_exhibition_game

    while !game.final? do
      @half_inning_object = game.next_half_inning
      @half_inning_object.save!
      hitting_team = @half_inning_object.half == "top" ? "away" : "home"
      game.update(current_inning: @half_inning_object.number)
      puts "--- #{@half_inning_object.half} #{@half_inning_object.number} ---"
      half_inning(hitting_team: hitting_team, game: game)
    end

    puts "Yankees scored #{game.away_score} runs"
    puts "Red Sox scored #{game.home_score} runs"

    game.print_line_score
  end

  def half_inning(hitting_team:, game:)
    if hitting_team == "away"
      lineup = game.lineups[:away_lineup]
      pitcher = game.home_pitcher
    else
      lineup = game.lineups[:home_lineup]
      pitcher = game.away_pitcher
    end

    @man_on_first = nil
    @man_on_second = nil
    @man_on_third = nil
    while @half_inning_object.status != "completed"
      hitter_index = hitting_team == "away" ? game.increment_away_hitter_index : game.increment_home_hitter_index
      hitter = lineup[hitter_index]
      plate_appearance = @half_inning_object.plate_appearances.create!(
        pitcher: pitcher,
        batter: hitter,
        runner_on_first: @man_on_first, 
        runner_on_second: @man_on_second, 
        runner_on_third: @man_on_third, 
      )

      puts "#{hitter.first_name} #{hitter.last_name} #{plate_appearance.outcome.code}"

      if plate_appearance.outcome.code == "strikeout"
        @half_inning_object.add_one_out
      elsif plate_appearance.outcome.code.downcase.first(3) == "fly"
        #### FLYBALL A #######
        if plate_appearance.outcome.code =~ /A$/
          if two_outs
            retire_the_side
          else
            @half_inning_object.add_one_out
            runners_advance_one_base(half: hitting_team)
          end
        #### FLYBALL B #######
        elsif plate_appearance.outcome.code =~ /B\.?$/
          if two_outs
            retire_the_side
          elsif
            @half_inning_object.add_one_out
            runner_from_third_scores(half: hitting_team)
          end
        #### FLYBALL C #######
        else
          @half_inning_object.add_one_out
        end
      elsif plate_appearance.outcome.code.downcase.first(2) == "gb"
        # TODO: Redo this with methods
        # TODO: Add Groundball B...handle Groundball X in some way for now
        if plate_appearance.outcome.code =~ /A\+?$/
          if two_outs
            retire_the_side
            clear_bases
          elsif (0..1).include?(@half_inning_object.outs)
            if @man_on_first.present?
              @half_inning_object.add_two_outs
              clear_bases
            elsif @man_on_third.present? && @man_on_second.present?
              @half_inning_object.add_one_out
              @half_inning_object.runs += 1
              @man_on_third  = @man_on_second # FIXME: I think runner's hold?
              @man_on_second = nil
            elsif @man_on_third.present?
              @half_inning_object.add_one_out
              @half_inning_object.runs += 1
              @man_on_third = nil
            elsif @man_on_second.present?
              @half_inning_object.add_one_out
              @man_on_third = @man_on_second
              @man_on_second = nil
            else # man on first
              @half_inning_object.add_one_out
            end
          end
        elsif plate_appearance.outcome.code =~ /C$/
          if two_outs
            retire_the_side
            clear_bases # necessary?
          else
            if @man_on_third.present?
              @half_inning_object.runs += 1
              @man_on_third = nil
              if @man_on_second.present?
                @man_on_third = @man_on_second
                @man_on_second = nil
              end
              if @man_on_first.present?
                @man_on_second = @man_on_first
                @man_on_first = nil
              end
            elsif @man_on_second.present?
              @man_on_third = @man_on_second
              @man_on_second = nil
              if @man_on_first.present?
                @man_on_second = @man_on_first
                @man_on_first = nil
              end
            elsif @man_on_first.present?
              @man_on_second = @man_on_first
              @man_on_first = nil
            else
              # nothing happens
            end
            @half_inning_object.add_one_out
          end
        else
          @half_inning_object.add_one_out
        end
      elsif plate_appearance.outcome.code =~ /^popout/
        @half_inning_object.add_one_out
      elsif plate_appearance.outcome.code =~ /^lineout/
        @half_inning_object.add_one_out
      elsif plate_appearance.outcome.code =~ /^foulout/
        @half_inning_object.add_one_out
      elsif plate_appearance.outcome.code =~ /^lo/
        @half_inning_object.add_one_out
      elsif plate_appearance.outcome.code =~ /^CATCH/
        @half_inning_object.add_one_out
      elsif plate_appearance.outcome.code == "HOMERUN" || plate_appearance.outcome.code == "HR" || plate_appearance.outcome.code == 'N-HR'
        @half_inning_object.runs += ([@man_on_third, @man_on_second, @man_on_first].compact.size + 1)
        clear_bases
      elsif plate_appearance.outcome.code =~ /^SI/i && plate_appearance.outcome.code =~ /\*{2}$/
        if @man_on_third.present?
          @half_inning_object.runs += 1
          @man_on_third = nil
          if @man_on_second.present?
            @half_inning_object.runs += 1
            @man_on_second = nil
          end
          if @man_on_first.present?
            @man_on_third = @man_on_first
            @man_on_first = nil
          end
          @man_on_first = hitter
        elsif @man_on_second.present?
          @half_inning_object.runs += 1
          @man_on_second = nil
          if @man_on_first.present?
            @man_on_third = @man_on_first
            @man_on_first = nil
          end
          @man_on_first = hitter
        elsif @man_on_first.present?
          @man_on_third = @man_on_first
          @man_on_first = nil
          @man_on_first = hitter
        else
          @man_on_first = hitter
        end 
      elsif plate_appearance.outcome.code =~ /^SI/i || plate_appearance.outcome.code =~ /^HBP/ || plate_appearance.outcome.code =~ /^WALK/
        if @man_on_third.present?
          @half_inning_object.runs += 1
          @man_on_third = nil
          if @man_on_second.present?
            @man_on_third = @man_on_second
            @man_on_second = nil
          end
          if @man_on_first.present?
            @man_on_second = @man_on_first
            @man_on_first = nil
          end
          @man_on_first = hitter
        elsif @man_on_second.present?
          @man_on_third = @man_on_second
          @man_on_second = nil
          if @man_on_first.present?
            @man_on_second = @man_on_first
            @man_on_first = nil
          end
          @man_on_first = hitter
        elsif @man_on_first.present?
          @man_on_second = @man_on_first
          @man_on_first = nil
          @man_on_first = hitter
        else
          @man_on_first = hitter
        end
      elsif plate_appearance.outcome.code =~ /^DO/i
        if @man_on_third.present?
          @half_inning_object.runs += 1
          @man_on_third = nil
          if @man_on_second.present?
            @half_inning_object.runs += 1
            @man_on_second = nil
          end
          if @man_on_first.present?
            @man_on_third = @man_on_first
            @man_on_first = nil
          end
          @man_on_second = hitter
        elsif @man_on_second.present?
          @half_inning_object.runs += 1
          @man_on_second = nil
          if @man_on_first.present?
            @man_on_third = @man_on_first
            @man_on_first = nil
          end
          @man_on_second = hitter
        elsif @man_on_first.present?
          @man_on_third = @man_on_first
          @man_on_first = nil
          @man_on_second = hitter
        else
          @man_on_second = hitter
        end 
      elsif plate_appearance.outcome.code =~ /^TR/i
        @half_inning_object.runs += [@man_on_third, @man_on_second, @man_on_first].compact.size
        clear_bases
        @man_on_third = hitter
      else
        puts "I don't recognize #{plate_appearance.outcome.code}"
      end

      @half_inning_object.save! # Eventually plate appearance should call this
      break if game.going_final? # Not sure why the 'break' is needed but it is for now to prevent extra AB after walk off win. FIXME
    end
  end

  def clear_bases
    # NOTE: Doesn't actual score runs
    @man_on_third, @man_on_second, @man_on_first = nil, nil, nil
  end

  def bases_empty
    @man_on_first == nil && @man_on_second == nil && @man_on_third == nil
  end

  def runners_advance_one_base(half: "away")
    return if bases_empty
    score_key = half.to_sym

    if @man_on_third
      @man_on_third = nil
      @half_inning_object.runs += 1
    end
 
    if @man_on_second
      @man_on_third = @man_on_second
      @man_on_second = nil
    end

    if @man_on_first
      @man_on_second = @man_on_first
      @man_on_first = nil
    end
  end

  def runner_from_third_scores(half: "away")
    return if @man_on_third.nil?
    score_key = half.to_sym

    if @man_on_third
      @man_on_third = nil
      @half_inning_object.runs += 1
    end
  end

  def two_outs
    @half_inning_object.outs == 2
  end

  def retire_the_side
    @half_inning_object.update(outs: 3)
  end  

  def create_new_exhibition_game
    high_id = 99999
    Game.destroy(high_id) if Game.where(id: high_id).count > 0
    game = Game.create!(
      id: high_id,
      away_team: Team.find_by(name: "Yankees"),
      home_team: Team.find_by(name: "Red Sox"),
      start_time: Time.now,
      status: :in_progress,
      current_inning: 1
    )
  end
end
