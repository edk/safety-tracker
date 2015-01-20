class TestRun < ActiveRecord::Base
  validates :name, presence: true
  validates :url, presence: true

  has_many :tests

  scope :recent, -> { order('id DESC').limit(50) }

  def components
    tests.map {|t| t.components.map {|c| c.name }  }.flatten.uniq.sort
  end

  def self.build_run name, url, examples
    test_run = TestRun.new
    test_run.name, test_run.url = name, url

    Array(examples).compact.map do |el|
      test_run.tests << Test.build_from_json(el)
    end

    test_run
  end
end
