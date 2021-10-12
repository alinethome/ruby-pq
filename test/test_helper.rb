def is_heap?(elements, &ordering)
  ordering ||= Proc.new { |a, b| a <=> b }

  (2...elements.length).each do |i|
    ele = elements[i]
    parent = elements[i/2]

    return false if ordering[parent, ele] > 0 
  end

  true
end
