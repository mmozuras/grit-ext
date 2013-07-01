require 'spec_helper'

module Grit
  describe DiffHunk do
    let(:diff_hunk) { DiffHunk.new(header, hunk.split("\n")) }

    shared_context 'hunk with two added lines' do
      let(:header) { DiffHeader.new('@@ -10,4 +10,6 @@') }
      let(:hunk) { <<-eos
   if something
     one
+    two
+    three
     four
   end
eos
      }
    end

    describe '#lines' do
      include_context 'hunk with two added lines'
      subject { diff_hunk.lines }

      its(:count) { should == 6 }
      specify { subject[3].content.should == '    three' }
      specify { subject[3].status.should == :added }
      specify { subject[3].position.should == 13 }
    end

    describe '#added' do
      include_context 'hunk with two added lines'
      subject { diff_hunk.added }

      its(:count) { should == 2 }
    end

    describe '#removed' do
      include_context 'hunk with two added lines'
      subject { diff_hunk.removed }

      its(:count) { should == 0 }
    end

    describe '#unchanged' do
      include_context 'hunk with two added lines'
      subject { diff_hunk.unchanged }

      its(:count) { should == 4 }
    end
  end
end
