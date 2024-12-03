require_relative '../safe_reports_counter'
require_relative '../report'

result = SafeReportsCounter.new.safe_reports_count(true)
puts "Result: #{result}"
