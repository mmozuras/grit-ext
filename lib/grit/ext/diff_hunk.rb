module Grit
  class DiffHunk
    attr_reader :lines

    def initialize(header, diff_hunk)
      @lines = diff_hunk.each_with_index.map do |line, index|
        content = line[1..line.length - 1]
        status = case line[0]
                 when '+' then :added
                 when '-' then :removed
                 when ' ' then :unchanged
                 end
        position = header.start + index

        DiffLine.new(content, status, position)
      end
    end

    def added
      @lines.find_all { |line| line.added? }
    end

    def removed
      @lines.find_all { |line| line.removed? }
    end

    def unchanged
      @lines.find_all { |line| line.unchanged? }
    end
  end
end
