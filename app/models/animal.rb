class Animal < ActiveRecord::Base

  belongs_to :species

  validates_presence_of :name
  validates_presence_of :date_of_birth

  validate :validate_born_in_the_past

  def born_in_the_future?
    date_of_birth > Time.now
  end

  def validate_born_in_the_past
    if born_in_the_future?
      errors.add(:date_of_birth, "can not be in the future.")
    end
  end

  def feed
    update_attribute(:last_fed, Time.now)
  end

end
