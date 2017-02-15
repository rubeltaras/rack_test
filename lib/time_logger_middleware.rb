class TimeLoggarMidleware
  def initialize(appl)
    @appl = appl
  end

  def call(env)
      start_time = Time.now
    status, headers, body = @appl.call(env)
      puts "This request have taken #{start_time - Time.now} seconds to complete "
    append_s = "... greetings from RubyLearning!!"
    [status, headers, body << append_s]
  end
end