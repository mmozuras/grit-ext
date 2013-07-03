module Grit
  class DiffHunk
    attr_reader :lines

    def initialize(header, diff_hunk)
      @header = header
      @lines = []

      diff_hunk.each_with_index.map do |line, index|
        content = line[1..line.length - 1]
        status = DiffLine.status_from_char(line[0])

        if status
          line_number = header.start + index

          case status
          when :added, :unchanged
            line_number = line_number - removed.count
          when :removed
            line_number = line_number - added.count
          end

          @lines << DiffLine.new(content, status, line_number, index)
        end
      end.compact
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

    def to_s
      "#{@header}\n#{lines.join("\n")}"
    end
  end
end
