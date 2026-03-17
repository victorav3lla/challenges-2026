def sum_odd_indexed(array)
  # TODO: computes the sum of elements at odd indexes (1, 3, 5, 7, etc.)
  #       You should use Enumerable#each_with_index
  sum = 0
  array.each_with_index do |e, i|
    sum += e if (i % 2).odd?
  end
  sum
end

def even_numbers(array)
  # TODO: Return the even numbers from a list of integers.
  #       You should use Enumerable#select
  #
  array.select { |e| (e % 2).zero? }
end

def short_words(array, max_length)
  # TODO: Take an array of words, return the array of words not exceeding max_length characters
  #       You should use Enumerable#reject
  #
  array.reject { |w| w.length > max_length }
end

def first_under(array, limit)
  # TODO: Return the first number from an array that is less than limit.
  #       You should use Enumerable#find
  array.find { |fn| fn < limit }
end

def add_bang(array)
  # TODO: Take an array of strings and return a new array with "!" appended to each string.
  #       You should use Enumerable#map
  array.map { |s| "#{s}!" }
end

def concatenate(array)
  # TODO: Concatenate all strings given in the array.
  #       You should use Enumerable#reduce
  array.reduce { |s, c| s + c }
end

def sorted_pairs(array)
  # TODO: Reorganize an array into slices of 2 elements, and sort each slice alphabetically.
  #       You should use Enumerable#each_slice
  a = []
  array.each_slice(2) { |e| a.push(e.sort_by(&:downcase)) }
  a
end
