module CodeminerOpenSource
  class CSVGenerator
    DEFAULT_OUTPUT_FILE_PATH = "output.csv"
    DEFAULT_HEADERS = ["Nome do repositório", "Link"].freeze

    def initialize(collection:, output_path: DEFAULT_OUTPUT_FILE_PATH, headers: DEFAULT_HEADERS)
      @collection = collection
      @output_path = output_path
      @headers = headers
    end

    def call
      CSV.open(output_path, "w", headers: true) do |csv|
        csv << headers
        collection.map do |item|
          csv << item
        end
      end
    end

    def headers
      @headers ||= headers
    end

    private

    attr_reader :collection, :output_path, :headers
  end
end
