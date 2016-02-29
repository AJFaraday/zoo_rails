module AnimalsHelper

  def species_options
    species = Species.order('name asc')
    species.collect{|s| [s.name, s.id]}
  end

  def age_of_animal(animal)
    time_ago_in_words(animal.date_of_birth)
  end

end
