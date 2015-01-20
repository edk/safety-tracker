
json.code :success
json.array!(@test_runs) do |tr|
  json.id tr.id
  json.url test_run_url(tr)
  json.components tr.components
end


