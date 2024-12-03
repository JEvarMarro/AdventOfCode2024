require_relative 'file_reader'
require_relative 'report'

class SafeReportsCounter
  def initialize
    @reports = FileReader.new.reports.map { |report| Report.new(report) }
  end

  def safe_reports_count
    @reports.count(&:safe?)
  end
end
