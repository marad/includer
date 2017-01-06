# Includer

Includer is a simple tool written in Racket programming language.
I'ts purpose is to add `#include` directive to configuration files that
miss this functionality (like i3).

## How does it work?

This is really simple. It copies file from one place to another,
and if the file contains `#include some_file` line it'll be replaced
with contents of `some_file`.

This is not recirsive so if `some_file` has `#include` directives, they won't
be expanded.

## Why?

I use it in my dotfiles repository for generating environment profiles. I've
noticed that this is easy when configuration file supports including other files.
So the easiest way to add environment profiles to configuration files that are
lacking the `include` function is to just add it myself.

## So why Racket?

Because I don't know it and I like to try new things. I know that written in C
executable would probably be like 20 times smaller and a lot faster. But it would
require a bit more work and would be much less fun and teaching.
