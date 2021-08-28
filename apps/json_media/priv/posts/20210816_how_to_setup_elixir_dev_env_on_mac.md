---
[title: "Elixir 개발 환경을 설정해봅시다 (Mac)"]
---

Mac 에서 Elixir 로 개발할 때 일반적으로 사용되는 개발 환경 설정 방법을 알아보겠습니다.

## asdf

**asdf** 는 요즘 대세가 되어가고 있는 tool version manager 입니다.\
[asdf - Manage multiple runtime versions with a single CLI tool](https://asdf-vm.com/)

각 언어별로 이런 역할을 하는 툴들이 있는데 (nvm, rbenv, pyenv, sdkman, ...)\
이제는 거의 asdf 로 통일되는 분위기 입니다.\
알만한 대부분의 언어를 지원하고, 언어만을 위한 툴이 아니다보니 gradle 같은 다른 툴들의 version managing 도 지원합니다.\
erlang, elixir 는 First Party 로 지원합니다.\
[asdf Plugin List](https://github.com/asdf-vm/asdf-plugins#plugin-list)\
\
(참고로 저는 요즘 Nix 를 사용 중입니다만, 아직 직접 설정은 할 줄 몰라서 패스.)

### asdf 설치

[asdf Getting Started](https://asdf-vm.com/guide/getting-started.html) 문서를 참고해주세요.

저는 brew 로 설치해보았습니다.

```shell
$ brew install asdf
```

## Elixir

elixir 는 erlang 을 기반으로 하는 언어라서 erlang, elixir 둘 다 설치가 필요합니다.

### asdf 에서 erlang 설치

[asdf-erlang Install](https://github.com/asdf-vm/asdf-erlang#install) 문서를 참고해주세요.

```shell
# erlang 설치 전 autoconf, wxmac 설치
$ brew install autoconf
$ brew install wxmac

# asdf erlang plugin 설치
$ asdf plugin-install erlang
```

```shell
# erlang version 확인
$ asdf list-all erlang
...
24.0.5

# 위 목록에서 가장 최신인 24.0.5 을 설치해봅시다
$ asdf install erlang 24.0.5
```

### asdf 에서 elixir 설치

erlang 설치 방법과 비슷합니다. [asdf-elixir Install](https://github.com/asdf-vm/asdf-elixir#install) 문서를 참고해주세요.

```shell
# asdf elixir plugin 설치
$ asdf plugin-install elixir

# elixir version 확인
$ asdf list-all elixir
...
1.12.2

# 위 목록에서 가장 최신인 1.12.2 를 설치해봅시다
$ asdf install elixir 1.12.2
```

### asdf 에서 erlang, elixir global 버전 설정

asdf 에서는 local 버전이 설정되어있지 않을 때 공통적으로 적용되는 global 버전을 설정할 수 있습니다.\
어떤 버전을 설치한다고 global 버전이 자동으로 설정되지 않기 때문에 직접 설정해주어야 합니다.

```shell
$ asdf global erlang 24.0.5
$ asdf global elixir 1.12.2
```

### asdf 에서 erlang, elixir local 버전 설정

위에 언급했던 local 버전은 현재 path 와 그 하위 path 를 포함해 적용됩니다.\
설정하면 자동으로 `.tool_versions` 파일이 생성되어 그 안에 기록됩니다. `.tool_versions` 파일을 직접 수정해도 똑같이 적용됩니다.

```shell
$ asdf local erlang 24.0.5
$ asdf local elixir 1.12.2
```

```
# .tool_versions

erlang 24.0.5
elixir 1.12.2
```

## VSCode

Elixir 를 개발하기에 VSCode 는 매우 좋은 IDE 입니다.

[Visual Studio Code - Code Editing. Redefined](https://code.visualstudio.com/)

설치는 알아서 'ㅁ'

### extension 설치

- ElixirLS Fork

[VSCode ElixirLS extension](https://marketplace.visualstudio.com/items?itemName=JakeBecker.elixir-ls)\
VSCode 에서 Elixir 를 지원하도록 해주는 extension 입니다.

- Dash

[VSCode Dash extension](https://marketplace.visualstudio.com/items?itemName=deerawan.vscode-dash)\
Dash 는 language, framework 등의 문서를 통째로 다운받아 매우 빠르고 편하게 볼 수 있도록 해주는 프로그램입니다.\
Elixir 는 압도적으로 문서화가 잘 되어있기 때문에 Dash 를 이용하면 개발에 매우 큰 도움이 됩니다. (유료)\
이 extension 은 궁금한 모듈이나 함수 위에 커서를 두고 `Ctrl + H` 를 누르면 바로 Dash 에서 해당 부분의 문서를 보여줍니다.\
아래 링크에서 Dash 를 설치한 후 사용하실 수 있습니다.\
[Dash](https://kapeli.com/dash)

이러면 Elixir 로 개발하기 위한 기본적인 설정이 끝납니다. 참 쉽죠?
