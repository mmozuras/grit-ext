# grit-ext

[![Build Status](https://secure.travis-ci.org/mmozuras/grit-ext.png)](http://travis-ci.org/mmozuras/grit-ext)

[grit-ext][] adds additional functionality to [grit][]. It was primarily created
to be used by [pronto][].

## Usage

To use [grit-ext][], after installing, just require 'grit-ext':

    require 'grit-ext'

All of the extensions, additionally to normal grit classes, will be available to
you.

### Diff#hunks

[Diff#hunks](https://github.com/mmozuras/grit-ext/blob/master/lib/grit/ext/diff.rb) method returns an array of [DiffHunk](https://github.com/mmozuras/grit-ext/blob/master/lib/grit/ext/diff_hunk.rb). These hunks provide structured information about the diff.

### Diff#repo

### Diff#full_a_path

### Diff#full_b_path

### Diff#added

### Diff#removed

### Blob#create_tempfile

[grit-ext]: https://rubygems.org/gems/grit-ext
[grit]: https://github.com/mojombo/grit
[pronto]: https://github.com/mmozuras/pronto
