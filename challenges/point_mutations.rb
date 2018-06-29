class DNA
  attr_reader :dna_string
  def initialize(dna_string)
    @dna_string = dna_string
  end

  def hamming_distance(other_dna_string)
    dna_string.chars.take(other_dna_string.size).select.with_index do |nucleide, index| 
      nucleide != other_dna_string[index]
    end.count
  end
end