require "csv"

module CodeminerOpenSource
  class CSVFile
    def initialize(path:)
      @path = path
    end

    def parse
      CSV.parse(file, headers: true)
    end

    private

    attr_reader :path

    def file
      @file ||= File.read(path)
    end
  end
end
