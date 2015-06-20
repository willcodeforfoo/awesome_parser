module AwesomeParser
  class Parser
    attr_reader :items

    def initialize(text)
      @text = text
      @items = []
    end

    def parse!
      @text.each_line do |line|
        heading = nil

        case line
        when /^\# ?(.+)/
          heading = $1

        when /\[(.+)\]\((.+)\) - (.+)/
          items << {
            url: $1,
            title: $2,
            description: $3,
            heading: heading,
            line: line,
          }
        end
      end
    end
  end
end
