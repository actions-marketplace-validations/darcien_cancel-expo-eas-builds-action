# Cancel Expo EAS Builds

This action checks for your EAS builds that are in queue or in progress and cancel them.

Only the last 10 builds are checked by default.

# Common use case

- You're starting new EAS build in your workflow but it fails because there's build in progress.

# Caveats

- This action is intended to be used together with [expo/expo-github-action](https://github.com/expo/expo-github-action) to make sure the eas CLI can make authenticated command for fetching and canceling builds.
- This action run `eas-cli` through `npx`, so you can install `eas-cli` yourself if you want to avoid running latest version available if `eas-cli` isn't found locally.

# Tested version

| expo-github-action | eas-cli | cancel-expo-eas-builds-action |
| :----------------: | :-------: | :---------------------------: |
|         v5         | <=0.18.x  |              v1               |

# Usage

<!-- start usage -->
```yaml
# Optional, authenticate with Expo using access token
- uses: expo/expo-github-action@v5
  with:
    expo-version: 4.x
    expo-token: ${{ secrets.EXPO_TOKEN }}

- name: Cancel previous EAS builds
  uses: darcien/cancel-expo-eas-builds-action@v1

# Run eas build after previous builds has been canceled
- name: EAS Build
  run: yarn run eas build --platform all --no-wait --non-interactive
```
<!-- end usage -->

# License

The scripts and documentation in this project are released under the [MIT License](LICENSE)
