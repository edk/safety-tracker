require 'test_helper'

class TestRunTest < ActiveSupport::TestCase
  test "building the obj with associated models" do
    sample = JSON.parse(File.open("#{ActionController::TestCase.fixture_path}/sample1.json").read)

    testrun = TestRun.build_run sample["name"], sample["url"], sample["examples"]
    testrun.save!

    assert_equal(testrun.name, sample["name"])
    assert_equal(testrun.url, sample["url"])
    assert_equal(testrun.tests.size, 40, "The test fixture has 40 failing examples, and there should be an equal number of associated objects")

    assert_equal(testrun.tests[25].components.size, 1)
    assert_equal(testrun.tests[25].components.first.name, 'invoicing')
    # make sure we didn't make a bunch of duplicate components
    assert_equal(Component.count, 2)
  end
end
