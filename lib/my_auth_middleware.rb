class MyAuthMiddleware
  def initialize(appl)
    @appl = appl
  end

  def call(env)
    if env.values_at("REMOTE_ADDR") == ["::1"]
      append_s = '
   <div class="wrapper row2">
  <div id="container" class="clear">
    <div id="fof" class="clear">
      <!-- ####################################################################################################### -->
      <div class="fl_left">
        <h1><span>404 Error</span><strong>?</strong></h1>
      </div>
      <div class="fl_right">
        <h2>Sorry, Possible Reasons:</h2>
        <ul>
          <li>In at nulla at lectus pulvinar commodo id et neque.</li>
          <li>Suspendisse sed ipsum nec nisi fringilla molestie.</li>
          <li>Sed tincidunt turpis at mauris interdum vitae fringilla urna posuere.</li>
          <li>Vivamus et lorem enim, vel placerat nulla.</li>
          <li>Ut interdum pharetra lorem, quis placerat purus dapibus in.</li>
        </ul>
      </div>
    </div>
  </div>
    </div>
 '
    else
      append_s = "Your IP is correct"
    end

    status, headers, body = @appl.call(env)

    # after request
    if  append_s == "Your IP is correct" then
      [status, headers, body << append_s]
    else
      [404, headers, body << append_s]
    end

  end
end