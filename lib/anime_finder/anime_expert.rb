class AnimeFinder::AnimeExpert
  attr_accessor :genres, :anime, :summary 
  
  def intialize(anime_hash)
    anime_hash.each do |key, value|
      self.send(("#{key}="), value)
    end
    save
  end
  
  def save
    @@all.push(self)
  end
  
  #show anime lists
  #tell summaries
end