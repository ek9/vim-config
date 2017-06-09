vim-config
============

[vim-config][0] is a personal dotfiles repository for [vim][2]. It is
compatible with [vcsh-dotfiles][1].

Part of [ek9/dotfiles][10] collection.

## Install

This repository is compatible with [vcsh-dotfiles][1]. You are advised to have
`vcsh-dotfiles bootstrap` and `mr update` working.

    $ vcsh clone https://github.com/ek9/vim-config
    $ mr update

This will make sure [vim-plug][4] is setup and plugins defined in `.vimrc` are
installed.

## Plugins

Main `.vimrc` configuration is published as [ek9/vimrc][3] plugin that can be
installed using [vim-plug][4]. For a list of other used plugins please check
`.vimrc`.

## Authors

Copyright (c) 2015-2016 ek9 <dev@ek9.co> (https://ek9.co).

## License

Licensed under [MIT License](LICENSE).

[0]: https://github.com/ek9/vim-config
[1]: https://github.com/ek9/vcsh-dotfiles
[2]: http://www.vim.org
[3]: https://github.com/ek9/vimrc
[4]: https://github.com/junegunn/vim-plug
[10]: https://github.com/ek9/dotfiles
