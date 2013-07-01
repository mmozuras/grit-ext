require 'spec_helper'

module Grit
  describe DiffLine do
    let(:diff_line) { DiffLine.new('  if something', :added, 12) }

    describe '#added?' do
      subject { diff_line.added? }
      it { should be_true }
    end

    describe '#removed?' do
      subject { diff_line.removed? }
      it { should be_false }
    end

    describe '#unchanged?' do
      subject { diff_line.unchanged? }
      it { should be_false }
    end
  end
end
