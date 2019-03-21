# Github Actions for [Calibre](https://calibreapp.com)

Calibre’s Github actions wrap our powerful [command line interface](https://calibreapp.com/cli) ([source](https://github.com/calibreapp/cli)) so that you can quickly and effortlessly add Calibre to your Github workflows.

That means that any command from CLI can be run using actions!

## Usage example

This example will create a snapshot for a given website that Calibre is tracking. It'll filter out non-master branch pushes. (Likely, your production environment).

```workflow
workflow "Create a Calibre snapshot" {
  on = "push"
  resolves = ["create calibre snapshot"]
}

action "Filter master branch" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "create calibre snapshot" {
  needs = ["Filter master branch"]
  uses = "calibreapp/github-actions@1.0.0"
  secrets = ["CALIBRE_API_TOKEN", "CALIBRE_SITE_SLUG"]
  args = "site create-snapshot --site=$CALIBRE_SITE_SLUG"
}
```

Secrets:

- `CALIBRE_API_TOKEN` is required. Generate a token in Calibre with the required scopes.
- `CALIBRE_SITE_SLUG` is optional, but required for many site based commands.

References:

- [Repo](https://github.com/calibreapp/github-actions)
- [Calibre CLI](https://calibreapp.com/cli)
- [CLI Source](https://github.com/calibreapp/cli)
