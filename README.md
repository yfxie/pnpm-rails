# PNPM Rails

For Rails app using pnpm as package manager.
Hook `pnpm install` and `pnpm run build` into `rails assets:precompile`.
This gem is like `jsbundling-rails` but for pnpm. And no installer like webpack, rollup, etc.

## Installation

```ruby
gem "pnpm-rails"
```

## Usage

When the deploy process `assets:precompile` gets called, `pnpm install` and `pnpm run build` will be called automatically.
It assumed you have `build` script for building assets in `package.json`.

```json
{
  "scripts": {
    "build": "webpack ..."
  }
}
```

### Environment variables

* `SKIP_PNPM_INSTALL` - skip `pnpm install` when `assets:precompile` gets called.
* `SKIP_JS_BUILD` - disable hooking `pnpm install` and `pnpm run build` into `assets:precompile`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yfxie/pnpm-rails.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
