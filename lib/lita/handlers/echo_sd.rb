# coding: utf-8
module Lita
  module Handlers
    class EchoSd < Handler
      # insert handler code here
      route(/^(?:(?:echo-)?sd(?<vertical>v?))(?:\s+(?<text>.+))?$/i, :echo_sd, command: false, help: {
        "(echo-)sd(v) " => "突然の死(v: vertical))."
      })

      def echo_sd(response)
        command = "/usr/local/bin/echo-sd "
        if !response.match_data[:vertical].empty?
          command += "-v "
        end
        if !response.match_data[:text].nil?
          command += Shellwords.escape(response.match_data[:text])
        end
        response.reply "```\n" + `#{command}` + "```"
      end
      Lita.register_handler(self)
    end
  end
end
