require 'spec_helper'

module Grit
  class FakeDiff < Diff
    attr_reader :diff

    def initialize(diff)
      @diff = diff
    end
  end

  describe Diff do
    let(:grit_diff) { FakeDiff.new(diff) }

    shared_context 'diff with one hunk' do
      let(:diff) do <<-eos
--- a
+++ b
@@ -10,4 +10,6 @@
   if something
     one
+    two
+    three
-    two_and_a_half
     four
   end
eos
      end
    end

    shared_context 'diff with two hunks' do
      let(:diff) do <<-eos
--- a
+++ b
@@ -7,3 +7,3 @@
   if something
+    two
-    three
@@ -15,1 +15,2 @@
   for i in list
+    make stuff happen
eos
      end
    end

    describe '#added' do
      subject { grit_diff.added }

      context 'one hunk' do
        include_context 'diff with one hunk'

        its(:count) { should == 2 }
        its(:'first.added?') { should be_true }
      end
    end

    describe '#removed' do
      subject { grit_diff.removed }

      context 'two hunks' do
        include_context 'diff with two hunks'

        its(:count) { should == 1 }
        its(:'first.removed?') { should be_true }
      end
    end

    describe '#hunks' do
      subject { grit_diff.hunks }

      context 'empty diff' do
        let(:diff) { '' }
        its(:count) { should == 0 }
      end

      context 'one hunk' do
        include_context 'diff with one hunk'

        its(:count) { should == 1 }
        specify { subject.first.lines.count.should == 7 }
        specify { subject.first.added.count.should == 2 }
        specify { subject.first.removed.count.should == 1 }
      end

      context 'two hunks' do
        include_context 'diff with two hunks'

        its(:count) { should == 2 }
      end
    end
  end
end
