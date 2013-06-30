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

    describe '#hunks' do
      subject { grit_diff.hunks }

      context 'empty diff' do
        let(:diff) { '' }
        its(:count) { should == 0 }
      end

      context 'one hunk' do
        let(:diff) { <<-eos
--- a
+++ b
@@ -10,4 +10,6 @@
   if something
     one
+    two
+    three
     four
   end
eos
        }

        its(:count) { should == 1 }
        specify { subject.first.lines.count.should == 6 }
        specify { subject.first.added.count.should == 2 }
      end

      context 'two hunks' do
        let(:diff) { <<-eos
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
        }

        its(:count) { should == 2 }
      end
    end
  end
end
