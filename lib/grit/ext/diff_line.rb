module Grit
  class DiffLine < Struct.new(:content, :status, :line_number, :diff_position)
    def added?
      status == :added
    end

    def removed?
      status == :removed
    end

    def unchanged?
      status == :unchanged
    end

    def self.status_from_char(char)
      case char
      when '+' then :added
      when '-' then :removed
      when ' ' then :unchanged
      else
        nil
      end
    end

    def to_s
      "#{char_from_status}#{content}"
    end

    private

    def char_from_status
      case status
      when :added then '+'
      when :removed then '-'
      when :unchanged then ' '
      end
    end
  end
end
