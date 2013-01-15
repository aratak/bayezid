# Bayezid

Simple module requirement, based on bayesian network on Node.js framework

# Usage

``` javascript
  var bayezid = require('bayezid');

  var bayezid = new Bayezid({ rootFolder: "./path/to/folder" });
  bayezid.run(function (err, data) {
    console.log(data);
  });

```

# Testing

[![Build Status](https://travis-ci.org/aratak/bayezid.png)](https://travis-ci.org/aratak/bayezid)

`npm test` or `NODE_ENV=test mocha --compilers coffee:coffee-script`

# Contributing

I encourage you to contribute to Bayezid!
Please ensure that you provide appropriate test coverage and ensure the documentation is up-to-date. Bonus points if you perform your changes in a clean topic branch rather than master, and if you create a pull request for your changes to be discussed and reviewed.

Please also keep your commits atomic so that they are more likely to apply cleanly. That means that each commit should contain the smallest possible logical change. Don’t commit two features at once, don’t update the gemspec at the same time you add a feature, don’t fix a whole bunch of whitespace in a file at the same time you change a few lines, etc, etc.

For significant changes, you may wish to discuss your idea [here](https://github.com/aratak/bayezid/issues).

# Project name genesis

'Bayezid' name is consonant with last name of Bayes Thomas, English mathematician and Presbyterian minister, who known for having formulated a specific case of the theorem that bears his name. [![](http://ru.wikipedia.org/favicon.ico)](http://en.wikipedia.org/wiki/Thomas_Bayes)

Although, Bayezid I "the Thunderbolt" was the Sultan of the Ottoman Empire, from 1389 to 1402. [![](http://ru.wikipedia.org/favicon.ico)](http://en.wikipedia.org/wiki/Bayezid_I)
