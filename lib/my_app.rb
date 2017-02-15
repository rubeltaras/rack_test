class MyApp
  def call(env)
    sleep(1)
    [200, {"Content-Type" => "text/html"}, ["Hello Rack Participants from across the globe"]]
  end
end