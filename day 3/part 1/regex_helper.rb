class RegexHelper
  def self.regex_for_multiplication
    /mul\([0-9]{,3},[0-9]{,3}\)/
  end

  def self.regex_for_multiplication_factors
    /[0-9]{,3}/
  end
end
