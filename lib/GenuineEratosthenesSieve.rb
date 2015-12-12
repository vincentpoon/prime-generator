# Generates primes based on the algorithm described in:
# https://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf
class GenuineEratosthenesSieve 
  
  # Returns the first n primes
  def primes(n)
    composites = Hash.new{|h,k| h[k] = []}
    primes = []
    x = 2
    while primes.size < n do
      if !composites.key?(x)
        primes << x
        composites[x*x] = [x]
      else
        composites[x].each {|prime| composites[x+prime] << prime}
        composites.delete(x)
      end
      x = x+1
    end
    return primes
  end
  
  # Prints a multiplication table 
  def printMultiplicationTable(nums)
    rowLabelWidth = nums.last.to_s.length
    output = ""
    output << " "*(rowLabelWidth)
  
    nums.each do |colHeader|
     output << sprintf("%#{(colHeader*nums.last).to_s.length+1}s", colHeader)
    end
    output << "\n"
  
    nums.each do |row|
      output << sprintf("%-#{rowLabelWidth}d", row)
      nums.each do |col|
        output << sprintf("%#{(col*nums.last).to_s.length+1}d", row*col)
      end
      output << "\n"
    end
    return output
  end
  
end

