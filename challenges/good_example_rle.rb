module RunLengthEncoding
  def self.encode(str)
    str.gsub(/(.)\1+/) { |match| "#{match.size}#{match[0]}" }
  end

  def self.decode(str)
    str.gsub(/(\d+)(.)/) { $2 * $1.to_i }
  end
end