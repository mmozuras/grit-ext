# grit-ext

## Resources

* [grit](https://github.com/mojombo/grit)
* [grit-ext on RubyGems](https://rubygems.org/gems/grit-ext)

## How to Use

To use grit-ext, after installing, just require 'grit-ext':

    require 'grit-ext'

All of the extensions, additionally to normal grit classes, will be available to you.

## Diff#hunks

[Diff#hunks](https://github.com/mmozuras/grit-ext/blob/master/lib/grit/ext/diff.rb) method returns an array of [DiffHunk](https://github.com/mmozuras/grit-ext/blob/master/lib/grit/ext/diff_hunk.rb). These hunks provide structured information about the diff.
