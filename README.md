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

* Demo: http://sibevin.github.io/angular-tau-utils/
* Doc: http://sibevin.github.io/angular-tau-utils/doc/index.html
* Github: https://github.com/sibevin/angular-tau-utils
* Issue Report: https://github.com/sibevin/angular-tau-utils/issues

## Usage

Include `tau-utils` in your app dependence, then all tau modules are reday to use.

```js
angular.module('myApp', ['tau-utils'])
```

## Tau Modules

`angular-tau-utils` is separated into different tau modules, and you can use them individually. For example, if only `tau-switcher` is used, you can just add `tau-switcher` in your app dependence.

```js
angular.module('myApp', ['tau-switcher'])
```

Here is the tua module list:

* tau-switcher
* tau-checkbox-model

### tau-switcher

`tau-switcher` module provides several services: `TabSwitcher`, `BoolSwitcher`, `CycleSwitcher` and `PipeSwitcher`.

#### TabSwitcher

`TabSwitcher` is a service to handle the tab-switching. A tab can be any kinds of object, but `string` should be enough to handle most of usage cases.

```js
var app = angular.module('MyApp', ["tau-switcher"]);

app.controller("MyCtrl", [
  '$scope', 'TabSwitcher', function($scope, TabSwitcher) {
    $scope.ts = new TabSwitcher("home");
  }
]);
```

```html
<div class="tab-menu">
  <ul>
    <li><a herf="" ng-class="{active: ts.isTab('home')}" ng-click="ts.switch('home')">Home</a></li>
    <li><a herf="" ng-class="{active: ts.isTab('product')}" ng-click="ts.switch('product')">Product</a></li>
    <li><a herf="" ng-class="{active: ts.isTab('contact')}" ng-click="ts.setTab('contact')">Contact</a></li>
  </ul>
</div>
<div class="tab-page">
  <div ng-show="ts.isTab('home')"><h1>Home</h1></div>
  <div ng-show="ts.isTab('product')"><h1>Product</h1></div>
  <div ng-show="ts.isTab('contact')"><h1>Contact</h1></div>
</div>
```

#### BoolSwitcher

`BoolSwitcher` is a simplified version of `TabSwitcher`, only for handling boolean values.

```js
var app = angular.module('MyApp', ["tau-switcher"]);

app.controller("MyCtrl", [
  '$scope', 'BoolSwitcher', function($scope, BoolSwitcher) {
    $scope.bs = new BoolSwitcher();
  }
]);
```

```html
<div class="switch-btn" ng-class="{on: bs.getBool()}" ng-click="bs.switch()">
  <div class="bar"></div>
</div>
```

#### CycleSwitcher

`CycleSwitcher` is a service to handle a serial of ordered tabs, the difference between `TabSwitcher` and `CycleSwitcher` is `CycleSwitcher` must assign a tab array when creating a `CycleSwitcher` object, and the current tab in `CycleSwitcher` is switched between these tabs only.

```js
var app = angular.module('MyApp', ["tau-switcher"]);

app.controller("MyCtrl", [
  '$scope', 'CycleSwitcher', function($scope, CycleSwitcher) {
    $scope.cs = new CycleSwitcher(["case1", "case2", "case3"]);
  }
]);
```

```html
<div class="tab-menu">
  <ul>
    <li><a herf="" ng-click="cs.prev()">Previous</a></li>
    <li><a herf="" ng-click="cs.next()">Next</a></li>
    <li><a herf="" ng-click="cs.reset()">Back to first</a></li>
    <li><a herf="" ng-click="cs.setTab('case2')">Go to case2</a></li>
  </ul>
</div>
<div class="tab-page">
  <div ng-show="cs.isTab('case1')"><h1>Case1</h1></div>
  <div ng-show="cs.isTab('case2')"><h1>Case2</h1></div>
  <div ng-show="cs.isTab('case3')"><h1>Case3</h1></div>
</div>
```

#### PipeSwitcher

`PipeSwitcher` is a service to handle a serial of ordered tabs, the difference between `PipeSwitcher` and `CycleSwitcher` is that `PipeSwitcher` is not cycled, i.e., when calling `next()` at the last tab or `prev()` at the first tab, nothing happened. Besides, `PipeSwitcher` can assign the initial tab, i.e., the initial tab can be different to the first tab.

```js
var app = angular.module('MyApp', ["tau-switcher"]);

app.controller("MyCtrl", [
  '$scope', 'PipeSwitcher', function($scope, PipeSwitcher) {
    $scope.ps = new PipeSwitcher(["step1", "step2", "step3", "step4"], "step2");
  }
]);
```

```html
<div class="tab-menu">
  <ul>
    <li><a herf="" ng-class="{disable: ps.isFirst()}" ng-click="ps.prev()">Previous</a></li>
    <li><a herf="" ng-class="{disable: ps.isLast()}" ng-click="ps.next()">Next</a></li>
    <li><a herf="" ng-click="ps.reset()">Back to step2</a></li>
    <li><a herf="" ng-click="ps.setTab('step3')">Go to step3</a></li>
  </ul>
</div>
<div class="tab-page">
  <div ng-show="ps.isTab('step1')"><h1>Step1</h1></div>
  <div ng-show="ps.isTab('step2')"><h1>Step2</h1></div>
  <div ng-show="ps.isTab('step3')"><h1>Step3</h1></div>
  <div ng-show="ps.isTab('step4')"><h1>Step4</h1></div>
</div>
```

#### Another ng-switch ?

Sometimes, I just want to show/hide some elements according to some variables, ng-switch seems overwhelming to me. On the other hand, ng-switch creates the sub-scope which may just bring troubles and redundances.

### tau-checkbox-model

`tau-checkbox-model` module provides the `CheckboxModel` service.

#### CheckboxModel

`CheckboxModel` is a service to handle a group of checkboxes.

```js
var app = angular.module('MyApp', ["tau-checkbox-model"]);

app.controller("MyCtrl", [
  '$scope', 'CheckboxModel', function($scope, CheckboxModel) {
    $scope.roles = ["user", "manager", "admin"];
    $scope.roles_m = {};
    $scope.cm = new CheckboxModel({
      cands: $scope.roles,
      model: $scope.roles_m
    });
  }
]);
```

```html
<ul>
  <li><a herf="" ng-click="cm.selectAll()">Select All</a></li>
  <li><a herf="" ng-click="cm.selectAll(false)">Unselect All</a></li>
  <li><a herf="" ng-class="{disable: cm.isSelected('user')}" ng-click="cm.select('user')">Select "user"</a></li>
  <li><a herf="" ng-class="{disable: !cm.isSelected('user')}" ng-click="cm.select('user', false)">Unselect "user"</a></li>
</ul>
<div ng-repeat="role in roles">
  <input name="role" ng-model="roles_m[role]" type="checkbox" /> {{ role }}
</div>
```
#### Why not use a directive ?

Using a directive means the feature is binding with a DOM, it is not flexible and limits the usage. `CheckboxModel` can be applied to any kinds of checkboxes as long as they are using `ng-model`.

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

## Contributing

1. Fork it ( https://github.com/sibevin/angular-tau-utils/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Write tests for your code
4. Commit your changes (both code and tests) (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request

## Authors

Sibevin Wang

## Copyright

Copyright (c) 2014 Sibevin Wang. Released under the MIT license.
