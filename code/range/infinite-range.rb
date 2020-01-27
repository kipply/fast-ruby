require "benchmark/ips"

NUMBER = 100_000_000

def fast
  index = 0
  (0..).each do |i| 
    break if i > NUMBER
    i += 1
  end
end

# 2.25x slower
def slow
  i = 0
  (0..Float::INFINITY).each do |i| 
    break if i > NUMBER
    i += 1
  end
end

# 1.12x times slower
def stepped
  i = 0
  (0.step).each do |i| 
    break if i > NUMBER
    i += 1
  end
end

Benchmark.ips do |x|
  x.report("Infinite Range")  { fast }
  x.report("Without Infinite Range") { slow }
  x.report("Using step") { stepped }
  x.compare!
end

