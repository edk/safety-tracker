class Component < ActiveRecord::Base
  has_many :components_tests
  has_many :tests, through: :components_tests

  def self.get_component string
    if found = Component.where(:name => string).first
      found
    else
      Component.create!(:name => string)
    end
  end
end
