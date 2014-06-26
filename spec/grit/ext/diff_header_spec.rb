require 'spec_helper'

module Grit
  describe DiffHeader do
    let(:diff_hunk_header) { DiffHeader.new(header) }

    subject { diff_hunk_header }

    context 'simple' do
      let(:header) { '@@ -10,4 +11,6 @@' }

      its(:removed_start) { should == 10 }
      its(:removed_count) { should == 4 }

      its(:added_start) { should == 11 }
      its(:added_count) { should == 6 }

      its(:start) { should == 11 }
      its(:count) { should == 6 }
    end

    context 'with additional information' do
      let(:header) { "@@ -20,11 +20,7 @@ vim-github-comment requires [webapi], so if you don't have it in your bundle yet" }

      its(:removed_start) { should == 20 }
      its(:removed_count) { should == 11 }

      its(:added_start) { should == 20 }
      its(:added_count) { should == 7 }

      its(:start) { should == 20 }
      its(:count) { should == 7 }
    end
  end
end
