# Lets write a program that will translate RNA 
# sequences into proteins

# Note the stop codon terminates the translation 
# and the final methionine is not translated into 
# the protein sequence.--

# Below are the codons and resulting Amino Acids 
# needed for the exercise.

# Codon               Protein
# AUG                 Methionine
# UUU, UUC            Phenylalanine
# UUA, UUG            Leucine
# UCU, UCC, UCA, UCG  Serine
# UAU, UAC            Tyrosine
# UGU, UGC            Cysteine
# UGG                 Tryptophan
# UAA, UAG, UGA       STOP

class InvalidCodonError < StandardError
end

class Translation

  def self.of_codon(codon)
    case codon
    when 'AUG' then 'Methionine'
    when 'UUU', 'UUC' then 'Phenylalanine'
    when 'UUA', 'UUG' then 'Leucine'
    when 'UCU', 'UCC', 'UCA', 'UCG' then 'Serine'
    when 'UAU', 'UAC' then 'Tyrosine'
    when 'UGU', 'UGC' then 'Cysteine'
    when 'UGG' then 'Tryptophan'
    when 'UAA', 'UAG', 'UGA' then 'STOP'
    else raise InvalidCodonError, "#{codon} is not valid"
    end
  end

  def self.of_rna(strand)
    codons_list = []
    strand.chars.each_slice(3) do |codon|
      codons_list << codon.join
    end
    
    aa_list = []
    codons_list.each do |codon|
      current_codon = of_codon(codon)
      break if current_codon == 'STOP'
      aa_list << current_codon
    end

    aa_list
  end
end
