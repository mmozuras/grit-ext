module Grit
  class Diff
    def hunks
      header_lines.each_with_index
                  .map { |header, index|
        next_header = header_lines[index + 1]
        next_line_number = next_header ? next_header[1] : lines.count
        DiffHunk.new(header[0], lines[header[1], next_line_number - 1])
      }
    end

    protected

    def lines
      @lines ||= diff.split("\n")
    end

    def header_lines
      @header_lines ||= lines.each_with_index
           .find_all { |line, index| line.start_with?('@@') }
           .map { |line, index|
             header = DiffHeader.new(line)
             [header, index]
           }
    end
  end
end
