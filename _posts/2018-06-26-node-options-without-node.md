---
title: NODE_OPTIONS without node
---

I was using [storybook](https://storybook.js.org/) and found it had grown so large that its node process would run out of memory before it could start. The downside was that the `storybook` command did not accept node arguments, like `--max_old_space_size=4096`

Starting with [node 8](https://nodejs.org/dist/latest-v8.x/docs/api/cli.html#cli_node_options_options), node will look for options in an environment variable named `NODE_OPTIONS` to be interpreted as if they had been specified on the command line before the actual command line (so they can be overridden).

Example to give storybook more memory:

```
NODE_OPTIONS=--max_old_space_size=4096 storybook start
```

*References:*
*[https://storybook.js.org](https://storybook.js.org)*
*[https://nodejs.org/dist/latest-v8.x/docs/api/cli.html#cli_node_options_options](https://nodejs.org/dist/latest-v8.x/docs/api/cli.html#cli_node_options_options)*
