class TestRunsController < ApplicationController
  def index
    @test_runs = TestRun.recent
  end

  def show
    begin
      @test_run = TestRun.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @not_found = true
    end
  end

  def create
    tr_params = test_run_params
    @test_run = TestRun.build_run tr_params[:name], tr_params[:url], params[:examples]

    if @test_run.save
      respond_to do |format|
        format.json
      end
    else
      respond_to do |format|
        format.json {
          render :json => {:error => @test_run.errors.full_messages}, :status => 422
        }
      end
    end
  end

  protected
  def test_run_params
    # nested data in examples doesn't play nicely with strong params
    params.permit(:name, :url, :tags, :examples)
  end
end
