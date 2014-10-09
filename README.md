# Angular Tau Utilities

[![Bower version](https://badge.fury.io/bo/angular-tau-utils.svg)][bower]
[![NPM version](https://badge.fury.io/js/angular-tau-utils.svg)][npm]
[![Build Status](https://travis-ci.org/sibevin/angular-tau-utils.svg?branch=build)][travis]
[![Coverage Status](https://coveralls.io/repos/sibevin/angular-tau-utils/badge.png?branch=cover-check)][cover-check]

[bower]: http://badge.fury.io/bo/angular-tau-utils
[npm]: http://badge.fury.io/js/angular-tau-utils
[travis]: https://travis-ci.org/sibevin/angular-tau-utils
[cover-check]: https://coveralls.io/r/sibevin/angular-tau-utils?branch=cover-check

Utilitis for AngularJS app

## Usage

Include `angular-tau-utils` in your app dependence, then all tau modules are reday to use.

```js
angular.module('myApp', ['angular-tau-utils'])
```

## Tau Modules

`angular-tau-utils` are separated into different tau modules, and you can use them individually. For example, if only `tau-switcher` is used, you can just add `tau-switcher` in your app dependence.

```js
angular.module('myApp', ['tau-switcher'])
```

Here is the tua module list:

* tau-switcher

### tau-switcher

`tau-switcher` module provides three services: `TabSwitcher`, `BoolSwitcher` and `CycleSwitcher`.

#### TabSwitcher

`TabSwitcher` is a service to handle the tab-switching. A tab can be any kinds of object, but `string` should be enough to handle most of usage cases.

```js
ts = new TabSwitcher(); // if no tab is given, the default init tab is "none"

ts.isTab("none"); // use isTab() to test the current tab and given tab are matched or not.
// true

ts.switch("home"); // use switch() to switch tab to the given tab
ts.isTab("home");
// true
ts.isTab("none");
// false

ts.reset(); // use reset() to switch tab to the init tab
ts.isTab("home");
// false
ts.isTab("none");
// true

ts.switch("product");
ts.switch("product"); // if switch to current tab, the current tab would be reset to init tab
ts.isTab("product");
// false
ts.isTab("none");
// true

ts.switch("contact");
ts.isTab("contact");
// true
ts.getTab(); // use getTab() to get the current tab
// "contact"

ts.setTab("home"); // use setTab() to set the current tab with the given tab
```

`TabSwitcher` is for handling the tab switching between serial of tab bottoms.

```html
<a ng-click="ts.switch('home')"> Home </a>
<a ng-click="ts.switch('product')"> Product </a>
<a ng-click="ts.switch('contact')"> Contact Me </a>
<div ng-show="ts.isTab('home')">
  Home
</div>
<div ng-show="ts.isTab('product')">
  Product
</div>
<div ng-show="ts.isTab('contact')">
  Contact Me
</div>
```

#### BoolSwitcher

`BoolSwitcher` is a simplified version of `TabSwitcher`, only for handling boolean values.

```js
bs = new BoolSwitcher(); // if no tab is given, the default init value is false

bs.getBool(); // use getBool() to get the current boolean value
// false

bs.switch(); // use switch() to switch the boolean value
bs.getBool();
// true

bs.setBool(false); // use setBool() to set the current boolean value with the given value
bs.getBool();
// false

bs.reset(); // use reset() to set the current boolean value to the init value
bs.getBool();
// false
```

`BoolSwitcher` is very useful to create a switching buttom.

```html
<a ng-click="bs.switch()"> Show/Hide Information </a>
<div ng-show="bs.getBool()">
  Show some information
</div>
```

#### CycleSwitcher

`CycleSwitcher` is a service to handle a serial of ordered tabs, the difference between `TabSwitcher` and `CycleSwitcher` is `CycleSwitcher` must define an array of tabs when creating a `CycleSwitcher` object, and the current tab in `CycleSwitcher` only be switched between these tabs.

```js
tabs = ["case1", "case2", "case3"];
cs = new CycleSwitcher(tabs); // create a cycle switcher object with a given tab array
cs.isTab("case1"); // the default init tab is the first tab in the array
// true

cs.isTab("case2"); // use isTab() to test the current tab and given tab are matched or not
// false

cs.getTab(); // use getTab() to get the current tab
// "case1"

cs.next(); // use next() to switch tab to the next tab
cs.getTab();
// "case2"
cs.next();
cs.getTab();
// "case3"
cs.next(); // if the current tab is the last tab, call next() would back to the first tab
cs.getTab();
// "case1"

cs.prev(); // use prev() to switch tab to the previous tab, if the current tab is the first tab, call prev() would go to the last tab
cs.getTab();
// "case3"

cs.reset(); // use reset() to switch tab to the init tab
cs.isTab("case1");
```

`CycleSwitcher` is for handling cycle-switching tabs.

```html
<a ng-click="cs.next()"> Next Case </a>
<div ng-show="cs.isTab('case1')">
  Case 1
</div>
<div ng-show="cs.isTab('case2')">
  Case 2
</div>
<div ng-show="cs.isTab('case3')">
  Case 3
</div>
```

#### Another ng-switch ?

Sometimes, I just want to show/hide some elements according to some variables, ng-switch seems overwhelming to me. On the other hand, ng-switch creates the sub-scope which may just bring troubles and redundances.

## Development

Clone the source from the repo

    git clone git@github.com:sibevin/angular-tau-utils.git

Prepare development env, install bower and npm packages

    npm install
    bower install

To build the source

    grunt build

To test the source

    grunt test

To see the coverage

    grunt cov

## Authors

Sibevin Wang

## Copyright

Copyright (c) 2014 Sibevin Wang. Released under the MIT license.
