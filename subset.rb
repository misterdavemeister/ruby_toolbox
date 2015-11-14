def subsets(arr)
  get_subs, subs, len = [], [], arr.length

  len.times do |n|
    get_subs = get_subset(arr, n + 1);
    get_subs.each { |a| subs << a }
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
