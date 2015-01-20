class Test < ActiveRecord::Base
  belongs_to :test_run

  has_many :component_testlogs
  has_many :components, through: :component_testlogs

  serialize :data

  def self.build_from_json element
    #"description" "full_description" "status" "file_path" "line_number" "exception"
    test = Test.new
    test.data = element
    test.build_components_from_tags element["tags"]
    test
  end

  def build_components_from_tags tag_params
    tag_strings = Array(tag_params).map {|el| el.split(',') }.flatten
    tag_strings.each { |tag|
      component = Component.get_component(tag)
      self.components << component
    }
  end
end
