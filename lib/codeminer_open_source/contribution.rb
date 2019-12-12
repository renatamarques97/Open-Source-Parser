module CodeminerOpenSource
  class Error < StandardError; end

  class Contribution
    REPOSITORY_LINK_REGEX = /pull.*|issues.*|merge_requests.*|commit.*/
    NAME_COLUMN_NUMBER = 4

    def initialize(line:)
      @line = line
    end

    def name
      @name ||= line.split("/")[NAME_COLUMN_NUMBER].capitalize
    end

    def link
      @link ||= line.gsub(REPOSITORY_LINK_REGEX, "")
    end

    private

    attr_reader :line
  end
end
