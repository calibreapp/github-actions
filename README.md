# GitHub Actions for [Calibre](https://calibreapp.com)

Calibre’s GitHub actions wrap our powerful [command line interface](https://calibreapp.com/cli) ([source](https://github.com/calibreapp/cli)) so that you can quickly and effortlessly add Calibre to your GitHub workflows.

That means that any command from CLI can be run using actions!

## Usage example

This example will create a snapshot for a given website that Calibre is tracking. It'll filter out non-master branch pushes. (Likely, your production environment).

```workflow
name: Create Snapshot
on:
  pull_request:

jobs:
  build:
    name: calibreapp/github-actions
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Repo
        uses: actions/checkout@v2

      - name: Create Snapshot
        uses: calibreapp/github-actions@main
        env:
          CALIBRE_API_TOKEN: ${{ secrets.CALIBRE_API_TOKEN }}
        run: site create-snapshot --site=${{ secrets.CALIBRE_SITE_SLUG }}
```

Secrets:

- `CALIBRE_API_TOKEN` is required. Generate a token in Calibre with the required scopes.
- `CALIBRE_SITE_SLUG` is optional, but required for many site based commands.

References:

- [Repo](https://github.com/calibreapp/github-actions)
- [Calibre CLI](https://calibreapp.com/cli)
- [CLI Source](https://github.com/calibreapp/cli)
