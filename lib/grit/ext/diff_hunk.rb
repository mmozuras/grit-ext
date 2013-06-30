module Grit
  class DiffHunk
    def initialize(header, diff_hunk)
      @lines = diff_hunk.each_with_index.map do |line, index|
        content = line[1..line.length - 1]
        status = case line[0]
                 when '+' then :added
                 when '-' then :removed
                 when ' ' then :unchanged
                 end
        {
          content: content,
          status: status,
          position: header.start + index
        }
      end
    end

    def lines
      @lines
    end

    def added
      lines_by_status(:added)
    end

    def removed
      lines_by_status(:removed)
    end

    def unchanged
      lines_by_status(:unchanged)
    end

    private

    def lines_by_status(status)
      @lines.find_all { |line| line[:status] == status }
    end
  end
end
