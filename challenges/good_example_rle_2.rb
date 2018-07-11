module RunLengthEncoding
  def self.encode(str)
    str.chars
       .chunk(&:itself)
       .map { |_, arr| "#{arr.size if arr.size > 1}#{arr.first}" }.join
  end

  def self.decode(str)
    str.chars
       .chunk       { |char| ('0'..'9').include?(char) }
       .flat_map    { |bool, arr| bool ? arr.join.to_i : arr }
       .chunk_while { |a, b| a.is_a?(Integer) && b.is_a?(String) }
       .map         { |a, b| b ? b * a : a }
       .join
  end
end