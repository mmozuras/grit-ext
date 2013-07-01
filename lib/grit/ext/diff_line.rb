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
  end
end
