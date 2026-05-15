# homebrew-tap

Personal Homebrew tap for [@jbwashington](https://github.com/jbwashington)'s tools.

## Install

Tap once, then install whatever you need:

```sh
brew tap jbwashington/tap
brew install jbwashington/tap/authgate
```

Or install a formula directly without tapping — Homebrew taps implicitly:

```sh
brew install jbwashington/tap/authgate
```

Upgrades come through the normal channel:

```sh
brew upgrade
# or per-formula
brew upgrade authgate
```

## Formulae

### [`authgate`](Formula/authgate.rb)

Switch user-level CLI auth between named profiles. One command instead of `logout && login` whenever you flip between accounts on `wrangler`, `stripe`, `vercel`, `gh`, `doctl`, or `supabase`. Supports cross-service groups (`authgate use titan` flips them all at once), profile rename, and ships zsh completion automatically.

- **Source**: [github.com/jbwashington/authgate](https://github.com/jbwashington/authgate)
- **Install**: `brew install jbwashington/tap/authgate`
- **Docs**: See the [project README](https://github.com/jbwashington/authgate#readme) for full usage.

## Contributing

Bumping a formula's version after a new upstream release is a three-step ritual — kept here for future-me / collaborators:

```sh
# 1. Grab the new release tarball checksum
curl -fsSL https://github.com/jbwashington/<repo>/archive/refs/tags/v<X.Y.Z>.tar.gz \
  | shasum -a 256

# 2. Edit Formula/<name>.rb — update `url` and `sha256` (and `desc` if features changed)

# 3. Commit + push
git add Formula/<name>.rb
git commit -m "<formula> 0.X.Y -> 0.X.Z"
git push
```

`brew test jbwashington/tap/<formula>` validates the formula's `test do` block locally before pushing if you want belt-and-suspenders.

## License

Each formula points at an upstream repo with its own license. The formula files themselves are MIT.
