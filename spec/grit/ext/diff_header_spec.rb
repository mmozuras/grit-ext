require 'spec_helper'

module Grit
  describe DiffHeader do
    let(:diff_hunk_header) { DiffHeader.new(header) }

    subject { diff_hunk_header }

    let(:header) { '@@ -10,4 +11,6 @@' }

    its(:removed_start) { should == 10 }
    its(:removed_count) { should == 4 }

    its(:added_start) { should == 11 }
    its(:added_count) { should == 6 }

    its(:start) { should == 11 }
    its(:count) { should == 6 }
  end
end

