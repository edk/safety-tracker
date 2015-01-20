class ComponentTestlog < ActiveRecord::Base
  belongs_to :component
  belongs_to :test
end
