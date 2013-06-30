require 'spec_helper'

module Grit
  describe DiffHunk do
    let(:diff_hunk) { DiffHunk.new(header, hunk.split("\n")) }

    describe '#lines' do
      subject { diff_hunk.lines }

      context 'hunk with two added lines' do
        let(:header) { DiffHunkHeader.new('@@ -10,4 +10,6 @@') }
        let(:hunk) { <<-eos
   if something
     one
+    two
+    three
     four
   end
eos
        }

        its(:count) { should == 6 }
        specify { subject[3][:content].should == '    three' }
        specify { subject[3][:status].should == :added }
        specify { subject[3][:position].should == 13 }
      end
    end
  end
end
