/*! angular-tau-utils - v1.0.0 - 2014-10-08
* https://github.com/sibevin/angular-tau-utils/
* Copyright (c) 2014 Sibevin Wang; Licensed MIT */
(function() {
  angular.module("angular-tau-utils", ["tau-switcher"]);

}).call(this);

(function() {
  angular.module("tau-switcher", []);

}).call(this);

(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  angular.module("tau-switcher").factory("BoolSwitcher", function() {
    var BoolSwitcher;
    BoolSwitcher = (function() {
      BoolSwitcher.prototype.DEFAULT_BOOL = false;

      BoolSwitcher.prototype._init_bool = BoolSwitcher.DEFAULT_BOOL;

      BoolSwitcher.prototype._current_bool = BoolSwitcher.DEFAULT_BOOL;

      BoolSwitcher.prototype.reset = function() {
        return this._current_bool = this._init_bool;
      };

      BoolSwitcher.prototype.getBool = function() {
        return this._current_bool;
      };

      BoolSwitcher.prototype.setBool = function(bool) {
        return this._current_bool = bool ? true : false;
      };

      BoolSwitcher.prototype["switch"] = function() {
        return this._current_bool = !this._current_bool;
      };

      function BoolSwitcher(bool) {
        if (bool == null) {
          bool = this.DEFAULT_BOOL;
        }
        this["switch"] = __bind(this["switch"], this);
        this.setBool = __bind(this.setBool, this);
        this.getBool = __bind(this.getBool, this);
        this.reset = __bind(this.reset, this);
        this._init_bool = bool ? true : false;
        this.setBool(this._init_bool);
      }

      return BoolSwitcher;

    })();
    return BoolSwitcher;
  });

}).call(this);

(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  angular.module("tau-switcher").factory("CycleSwitcher", function() {
    var CycleSwitcher;
    CycleSwitcher = (function() {
      CycleSwitcher.prototype.DEFAULT_TABS = ["none"];

      CycleSwitcher.prototype._tabs = CycleSwitcher.DEFAULT_TABS;

      CycleSwitcher.prototype._current_index = 0;

      CycleSwitcher.prototype.next = function() {
        if (this._current_index + 1 >= this._tabs.length) {
          return this._current_index = 0;
        } else {
          return this._current_index = this._current_index + 1;
        }
      };

      CycleSwitcher.prototype.prev = function() {
        if (this._current_index - 1 < 0) {
          return this._current_index = this._tabs.length - 1;
        } else {
          return this._current_index = this._current_index - 1;
        }
      };

      CycleSwitcher.prototype.reset = function() {
        return this._current_index = 0;
      };

      CycleSwitcher.prototype.getTab = function() {
        return this._tabs[this._current_index];
      };

      CycleSwitcher.prototype.isTab = function(tab) {
        var _ref;
        if (tab instanceof Array) {
          return _ref = this.getTab(), __indexOf.call(tab, _ref) >= 0;
        } else {
          return tab === this.getTab();
        }
      };

      function CycleSwitcher(tabs) {
        if (tabs == null) {
          tabs = this.DEFAULT_TABS;
        }
        this.isTab = __bind(this.isTab, this);
        this.getTab = __bind(this.getTab, this);
        this.reset = __bind(this.reset, this);
        this.prev = __bind(this.prev, this);
        this.next = __bind(this.next, this);
        this._tabs = tabs;
        this.reset();
      }

      return CycleSwitcher;

    })();
    return CycleSwitcher;
  });

}).call(this);

(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  angular.module("tau-switcher").factory("TabSwitcher", function() {
    var TabSwitcher;
    TabSwitcher = (function() {
      TabSwitcher.prototype.DEFAULT_TAB = "none";

      TabSwitcher.prototype._init_tab = TabSwitcher.DEFAULT_TAB;

      TabSwitcher.prototype._current_tab = TabSwitcher.DEFAULT_TAB;

      TabSwitcher.prototype.reset = function() {
        return this._current_tab = this._init_tab;
      };

      TabSwitcher.prototype.getTab = function() {
        return this._current_tab;
      };

      TabSwitcher.prototype.setTab = function(tab) {
        return this._current_tab = tab;
      };

      TabSwitcher.prototype.isTab = function(tab) {
        var _ref;
        if (tab instanceof Array) {
          return _ref = this._current_tab, __indexOf.call(tab, _ref) >= 0;
        } else {
          return tab === this._current_tab;
        }
      };

      TabSwitcher.prototype["switch"] = function(tab) {
        if (this.isTab(tab)) {
          return this.reset();
        } else {
          return this.setTab(tab);
        }
      };

      function TabSwitcher(tab) {
        if (tab == null) {
          tab = this.DEFAULT_TAB;
        }
        this["switch"] = __bind(this["switch"], this);
        this.isTab = __bind(this.isTab, this);
        this.setTab = __bind(this.setTab, this);
        this.getTab = __bind(this.getTab, this);
        this.reset = __bind(this.reset, this);
        this._init_tab = tab;
        this.setTab(tab);
      }

      return TabSwitcher;

    })();
    return TabSwitcher;
  });

}).call(this);
