class Array
  def subsets(sub_length = nil)
    if sub_length.nil?
      subs, len = [], self.length

      len.times do |n|
        len_subs = get_subs(self, n + 1)
        len_subs.each { |s| subs << s }
      end

    else
      subs, sub_length = [], sub_length.to_i
      len_subs = get_subs(self, sub_length)
      len_subs.each { |s| subs << s }
    end
    return subs
  end


  def get_subs(arr, len)
    subs, length = [], arr.length

    if len == length
      return [arr]
    elsif len <= 0 || len > length
      return []
    elsif len == 1
      arr.each { |s| subs << [s] }
      return subs
    end

    ((length - len) + 1).times do |n|
      head = arr.slice(n, 1)
      rest = arr.slice(n + 1, length - head.length)
      tail = get_subs(rest, len - 1)

      tail.each do |t|
        merged = head.clone
        merged = merged.concat(t)
        subs << merged
      end
    end
    return subs
  end
end

test = [1, 2, 3, 4]
print "       test: "
p test.subsets
print "       test: "
p test.subsets(1)
print "combination: "
p test.combination(1).to_a
print "       test: "
p test.subsets(2)
print "combination: "
p test.combination(2).to_a
print "       test: "
p test.subsets(3)
print "combination: "
p test.combination(3).to_a
print "       test: "
p test.subsets(4)
print "combination: "
p test.combination(4).to_a
print "       test: "
p test.subsets(5)
print "combination: "
p test.combination(5).to_a
#=>
=begin
       test: [[1], [2], [3], [4], [1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4], [1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4], [1, 2, 3, 4]]
       test: [[1], [2], [3], [4]]
combination: [[1], [2], [3], [4]]
       test: [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]
combination: [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]
       test: [[1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]]
combination: [[1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]]
       test: [[1, 2, 3, 4]]
combination: [[1, 2, 3, 4]]
=end
