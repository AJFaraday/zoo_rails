class Species < ActiveRecord::Base

  validates_presence_of :name
  validates_uniqueness_of :name
 
  validates_presence_of :latin_name

  validates_numericality_of :no_of_legs, :greater_than_or_equal_to => 2

  def long_name
    "#{name} (#{latin_name})"
  end

end
