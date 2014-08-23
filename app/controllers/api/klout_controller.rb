module API
  class KloutController < ApiController

    @@key = 'qwgbx5cjs97y2368nb3qtpf8'

    def get_id
      http = Curl.get("http://www.google.com/")
    end

  end
end