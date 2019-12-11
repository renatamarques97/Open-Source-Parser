require "cm42/os/version"
require "csv"

module Cm42
  module Os
    class Error < StandardError; end

    class Os
      def initialize
      end

      def read_file(path)
        file = CSV.parse(File.read(path), headers: true)
      end

      def contributions
        contrib = read_file.by_col["Contribuições"]
      end

      def projects
        contributions.inject({}) do |acc, c|
          p = c.split("/")[4].capitalize
          acc[p] = c.gsub(/pull.*|issues.*|merge_requests.*|commit.*/, "")
          acc
        end
      end

      def headers
        headers = ["Nome do repositório", "Link"]
      end

      p = Os.new

      CSV.open("output.csv", "w", headers: true) do |csv|
        csv << p.headers
        p.projects.map do |key,value|
          puts key, value
          csv << [key, value]
        end
      end

    end
  end
end
