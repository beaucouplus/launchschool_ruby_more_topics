

def compute(string)
  return yield(string) if block_given?
  'Does not compute.'
end


# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'
# 

p compute("souris") { |item| item + " caca" }
p compute("souris") { |item| item * 3 }
p compute('voiture')