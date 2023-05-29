require_relative 'item'

class MusicAlbum < Item
  def initialize(name, publish_date)
    super(publish_date)
    @name = name    
  end
end