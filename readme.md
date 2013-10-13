# FG9

This is a [Mango Blog](http://www.mangoblog.org) theme I've developed for use at [FusionGrokker.com](http://fusiongrokker.com).

I publish my themes as open source so that others can benefit from them, learning how best to develop their own themes using the Mango custom tag system. All of my themes are "pod-enabled," because pods are awesome.

This particular theme is built using [Bootstrap 3](http://www.getbootstrap.com), and is heavily inspired by the design of the [Pro Git Book Website](http://git-scm.com/book). It uses commercial fonts from [TypeKit](http://typekit.com/) (free for Creative Cloud members).

The theme features:

* Responsive design so it works great on mobile devices of all sizes
* Parallax scrolling effect for header background graphic
* Easily swap out the header background graphic without any Photoshop/etc work
* Author comment styling
* Gravatar previews
* Lightbox effect
* Language-agnostic code [syntax highlighting](https://code.google.com/p/google-code-prettify/); currently using the "GitHub" syntax theme but it's [easily changed](http://jmblog.github.io/color-themes-for-google-code-prettify/). No need for a syntax highlighting plugin.
* `<pre></pre>` blocks scroll horizontally if needed, while `<code></code>` blocks wrap as needed on smaller screens

## Compiling JS and CSS

I use [CodeKit](http://incident57.com/codekit/) to continuously recompile my LESS-CSS and JavaScript changes; but there's nothing preventing you from using a different build system. `assets/css/bundle.css` is built from `assets/less/bundle.less`, which itself simply imports other resources.

## Open Source License

This theme is freely available under the terms of the MIT License:

> Copyright (c) 2013 Adam Tuttle

> Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

> The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
