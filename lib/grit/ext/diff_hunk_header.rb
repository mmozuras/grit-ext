module Grit
  class DiffHunkHeader
    attr_reader :start, :count

    def initialize(hunk_header)
      start, count = hunk_header.split('+').last.sub(' @@', '').split(',')
      @start = start.to_i
      @count = count.to_i
    end
  end
end
