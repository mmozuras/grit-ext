module Grit
  class Diff
    def hunks
      lines = diff.split("\n")
      lines.each_with_index
           .find_all { |line, index| line.start_with?('@@') }
           .map { |line, index| [DiffHeader.new(line), index] }
           .map { |header, index|
             DiffHunk.new(header, lines[index, header.count])
           }
    end
  end
end
