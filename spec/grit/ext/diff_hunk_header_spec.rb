require 'spec_helper'

module Grit
  describe DiffHunkHeader do
    let(:diff_hunk_header) { DiffHunkHeader.new(header) }

    subject { diff_hunk_header }

    let(:header) { '@@ -10,4 +10,6 @@' }

    its(:start) { should == 10 }
    its(:count) { should == 6 }
  end
end

