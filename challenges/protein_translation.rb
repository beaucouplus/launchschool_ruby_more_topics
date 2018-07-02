require 'pry'

class Translation
  CODON_SIZE = 3
  VALID_DNA_NUCLEIDES = %w(A C G U)

  PROTEINS = {
    Methionine: %w[AUG],
    Phenylalanine: %w[UUU UUC],
    Leucine: %w[UUA UUG],
    Serine: %w[UCU UCC UCA UCG],
    Tyrosine: %w[UAU UAC],
    Cysteine: %w[UGU UGC],
    Tryptophan: %w[UGG],
    STOP: %w[UAA UAG UGA]
  }
  def self.of_codon(codon)
    PROTEINS.select do |_, codon_sequence|
      codon_sequence.include?(codon)
    end.keys.first.to_s
  end

  def self.of_rna(strand)
    unless strand.chars.all? { |candidate| VALID_DNA_NUCLEIDES.include?(candidate) }
      raise InvalidCodonError.new("Not a DNA strand")
    end
    codons = []
    strand.chars.each_slice(CODON_SIZE) do |nucleotides|
      codon = nucleotides.join
      break if PROTEINS[:STOP].include?(codon)
      codons << codon
    end
    codons.map { |codon| self.of_codon(codon) }
  end
end

class InvalidCodonError < StandardError
end
