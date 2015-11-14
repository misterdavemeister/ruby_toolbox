def subsets(arr, sub_length = nil)
  if sub_length.nil?
    subs, get_subs, len = [], [], arr.length

    len.times do |n|
      get_subs = get_subset(arr, n + 1)
      get_subs.each { |s| subs << s }
    end

  else
    sub_length = sub_length.to_i
    subs, get_subs = [], []
    get_subs = get_subset(arr, sub_length)
    get_subs.each { |s| subs << s }
  end
  return subs
end


def get_subset(arr, i)
  subs, head, tail, len = [], [], [], arr.length

  if i == len
    return [arr]
  elsif i <= 0 || i > len
    return []
  elsif i == 1
    arr.each { |n| subs << [n] }
    return subs
  end

  ((len - i) + 1).times do |n|
    head = arr.slice(n, 1)
    rest = arr.slice(n + head.length, len - head.length)
    tail = get_subset(rest, i - 1)

    tail.each do |t|
      merged = head.clone
      merged = merged.concat(t)
      subs << merged
    end
  end

  return subs
end

p subsets([1, 2, 3]) #=> [[1], [2], [3], [1, 2], [1, 3], [2, 3], [1, 2, 3]]
p subsets([1, 2, 3, 4]) #=> [[1], [2], [3], [4], [1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4], [1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4], [1, 2, 3, 4]]
p subsets([1, 2, 3, 4, 5]) #=> [[1], [2], [3], [4], [5], [1, 2], [1, 3], [1, 4], [1, 5], [2, 3], [2, 4], [2, 5], [3, 4], [3, 5], [4, 5], [1, 2, 3], [1, 2, 4], [1, 2, 5], [1, 3, 4], [1, 3, 5], [1, 4, 5], [2, 3, 4], [2, 3, 5], [2, 4, 5], [3, 4, 5], [1, 2, 3, 4], [1, 2, 3, 5], [1, 2, 4, 5], [1, 3, 4, 5], [2, 3, 4, 5], [1, 2, 3, 4, 5]]

test = [1, 2, 3, 4, 5]
test.length.times { |n| p test.combination(n + 1).to_a }
#=> [[1], [2], [3], [4], [5]]
#[[1, 2], [1, 3], [1, 4], [1, 5], [2, 3], [2, 4], [2, 5], [3, 4], [3, 5], [4, 5]]
#[[1, 2, 3], [1, 2, 4], [1, 2, 5], [1, 3, 4], [1, 3, 5], [1, 4, 5], [2, 3, 4], [2, 3, 5], [2, 4, 5], [3, 4, 5]]
#[[1, 2, 3, 4], [1, 2, 3, 5], [1, 2, 4, 5], [1, 3, 4, 5], [2, 3, 4, 5]]
#[[1, 2, 3, 4, 5]]

(1..test.length).each { |n| p get_subset(test, n) }
#=> [[1], [2], [3], [4], [5]]
#[[1, 2], [1, 3], [1, 4], [1, 5], [2, 3], [2, 4], [2, 5], [3, 4], [3, 5], [4, 5]]
#[[1, 2, 3], [1, 2, 4], [1, 2, 5], [1, 3, 4], [1, 3, 5], [1, 4, 5], [2, 3, 4], [2, 3, 5], [2, 4, 5], [3, 4, 5]]
#[[1, 2, 3, 4], [1, 2, 3, 5], [1, 2, 4, 5], [1, 3, 4, 5], [2, 3, 4, 5]]
#[[1, 2, 3, 4, 5]]

print "       test: "
p subsets(test)
print "       test: "
p subsets(test, 1)
print "combination: "
p test.combination(1).to_a
print "       test: "
p subsets(test, 2)
print "combination: "
p test.combination(2).to_a
print "       test: "
p subsets(test, 3)
print "combination: "
p test.combination(3).to_a
print "       test: "
p subsets(test, 4)
print "combination: "
p test.combination(4).to_a
print "       test: "
p subsets(test, 5)
print "combination: "
p test.combination(5).to_a
#=>
=begin
test: [[1], [2], [3], [4], [5], [1, 2], [1, 3], [1, 4], [1, 5], [2, 3], [2, 4], [2, 5], [3, 4], [3, 5], [4, 5], [1, 2, 3], [1, 2, 4], [1, 2, 5], [1, 3, 4], [1, 3, 5], [1, 4, 5], [2, 3, 4], [2, 3, 5], [2, 4, 5], [3, 4, 5], [1, 2, 3, 4], [1, 2, 3, 5], [1, 2, 4, 5], [1, 3, 4, 5], [2, 3, 4, 5], [1, 2, 3, 4, 5]]
       test: [[1], [2], [3], [4], [5]]
combination: [[1], [2], [3], [4], [5]]
       test: [[1, 2], [1, 3], [1, 4], [1, 5], [2, 3], [2, 4], [2, 5], [3, 4], [3, 5], [4, 5]]
combination: [[1, 2], [1, 3], [1, 4], [1, 5], [2, 3], [2, 4], [2, 5], [3, 4], [3, 5], [4, 5]]
       test: [[1, 2, 3], [1, 2, 4], [1, 2, 5], [1, 3, 4], [1, 3, 5], [1, 4, 5], [2, 3, 4], [2, 3, 5], [2, 4, 5], [3, 4, 5]]
combination: [[1, 2, 3], [1, 2, 4], [1, 2, 5], [1, 3, 4], [1, 3, 5], [1, 4, 5], [2, 3, 4], [2, 3, 5], [2, 4, 5], [3, 4, 5]]
       test: [[1, 2, 3, 4], [1, 2, 3, 5], [1, 2, 4, 5], [1, 3, 4, 5], [2, 3, 4, 5]]
combination: [[1, 2, 3, 4], [1, 2, 3, 5], [1, 2, 4, 5], [1, 3, 4, 5], [2, 3, 4, 5]]
       test: [[1, 2, 3, 4, 5]]
combination: [[1, 2, 3, 4, 5]]
=end
