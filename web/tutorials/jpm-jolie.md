WARNING: Before publishing this tutorial, we have to decide a standard name for the module containing Binding and possibly a better name for the type. It could be `from ports import PortConfiguration` instead of `from types.Binding import Binding`.

WARNING: jpm doesn't support testing a package locally yet. I've put the workflow for packages that get published on npmjs.

We make a package and a client.

Go to the directory of your package, `calculator/`, and do the following:

- Make sure you have JPM installed: `sudo npm install -g @jolie/jpm`
- In `calculator/`, run `jpm init`. This will initialise a file called `jpm.json`, which is the configuration file of the package.
- Edit `jpm.json` to insert your data.
- To publish your package, run `npm publish --access public`. WARNING: `jpm publish` works only after we run `npm publish --access public` for the first time. Invoking npm shouldn't be necessary.

Now go to the directory of your client, `client/`, and do the following:
- Run `jpm init`
- Run `jpm add calculator`
- Run `jolie main.ol`

Need to decide whether there should be a `main.ol` file, which is the default file from which clients import symbols from the package. Having a `main.ol` file is not necessary.

