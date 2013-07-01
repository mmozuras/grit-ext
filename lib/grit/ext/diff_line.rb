module Grit
  class DiffLine < Struct.new(:content, :status, :position)
    def added?
      status == :added
    end

    def removed?
      status == :removed
    end

    def unchanged?
      status == :unchanged
    end

    def to_s
      symbol = case status
               when :added
                 '+'
               when :removed
                 '-'
               when :unchanged
                 ' '
               end
      "#{symbol}#{content}"
    end
  end
end
