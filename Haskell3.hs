//erathosthenes
import Data.List

primes :: Int -> [Int]
primes 0 = []
primes 1 = []
primes 2 = 2
primes int = filter sieve (take int [2,3..])

sieve :: [Int] -> [Int]
sieve [a] = 
sieve list = 
    let b:bs = take (last list) [2a,3a..]
    in sieve (filter 