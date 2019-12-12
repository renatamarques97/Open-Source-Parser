require "csv"
require 'codeminer_open_source/csv_file'
require 'codeminer_open_source/contribution'
require "codeminer_open_source/version"
require "codeminer_open_source/csv_generator"

module CodeminerOpenSource
  class Error < StandardError; end

  class RepositoryList
    REPOSITORY_LINK_COLUMN = "Contribuições"
    DEFAULT_CSV_GENERATOR = CSVGenerator

    def initialize(file_path:, csv_generator: DEFAULT_CSV_GENERATOR)
      @file_path = file_path
      @csv_generator = csv_generator
    end

    def all
      @all ||= contributions.map { |c| [c.name, c.link] }.uniq
    end

    def generate_csv
      csv_generator.new(collection: all).call
    end

    private

    attr_reader :file_path, :csv_generator

    def csv_file
      @csv_file ||= CSVFile.new(path: file_path).parse
    end

    def contributions_from_file
      @contributions_from_file ||= csv_file.by_col[REPOSITORY_LINK_COLUMN]
    end

    def contributions
      @contributions ||= contributions_from_file.map do |line|
        Contribution.new(line: line)
      end
    end
  end
end
