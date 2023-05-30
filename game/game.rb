require_relative '../item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at: date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def to_h
    { Publish_date: @publish_date,
      Mutiplayer: @multiplayer,
      Last_played: @last_played_at,
      first_name: @author.first_name,
      last_name: @author.last_name
     }
  end
  private

  def can_be_archived?
    current_date = Date.today
    return true if super && last_played_at < Date.new(current_date.year - 2, current_date.month, current_date.day)

    false
  end
end