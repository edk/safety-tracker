
if @not_found
  json.error "Record not found"
else
  json.id @test_run.id
  json.url test_run_url(@test_run)
  json.components @test_run.components
end

