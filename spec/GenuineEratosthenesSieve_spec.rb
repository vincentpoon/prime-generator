require "GenuineEratosthenesSieve"
require 'spec_helper'
require 'Prime'

describe GenuineEratosthenesSieve do
  let(:sieve) { GenuineEratosthenesSieve.new }
  it 'generates valid prime numbers' do
    expect(sieve.primes(-1)).to be_empty
    expect(sieve.primes(0)).to be_empty
    expect(sieve.primes(1)).to eq [2]
    expect(sieve.primes(10)).to eq [2,3,5,7,11,13,17,19,23,29]
    expect(sieve.primes(10000)).to eq Prime.first(10000)
  end
  it 'properly print out a multiplication table' do
    
    table2 = <<TABLE
  2 3
2 4 6
3 6 9
TABLE
        expect(sieve.printMultiplicationTable(sieve.primes(2))).to eq table2
   
    table10 = <<TABLE
    2  3   5   7  11  13  17  19  23  29
2   4  6  10  14  22  26  34  38  46  58
3   6  9  15  21  33  39  51  57  69  87
5  10 15  25  35  55  65  85  95 115 145
7  14 21  35  49  77  91 119 133 161 203
11 22 33  55  77 121 143 187 209 253 319
13 26 39  65  91 143 169 221 247 299 377
17 34 51  85 119 187 221 289 323 391 493
19 38 57  95 133 209 247 323 361 437 551
23 46 69 115 161 253 299 391 437 529 667
29 58 87 145 203 319 377 493 551 667 841
TABLE
    expect(sieve.printMultiplicationTable(sieve.primes(10))).to eq table10
    
    
  end
end