module Grit
  class DiffHeader
    attr_reader :removed_start, :removed_count,
                :added_start, :added_count

    alias_method :start, :added_start
    alias_method :count, :added_count

    def initialize(hunk_header)
      groups = hunk_header.split('-').last.split('+')

      removed = groups.first.strip
      added = groups.last.sub(' @@', '').strip

      @removed_start, @removed_count = get_numbers(removed)
      @added_start, @added_count = get_numbers(added)
    end

    private

    def get_numbers(s)
      start, count = s.split(',')
      [start.to_i, count.to_i]
    end

    def to_s
      "@@ -#{removed_start},#{removed_count} +#{added_start},#{added_count} @@"
    end
  end
end
