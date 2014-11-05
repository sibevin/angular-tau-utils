/*! angular-tau-utils - v2.0.0 - 2014-11-05
* https://github.com/sibevin/angular-tau-utils/
* Copyright (c) 2014 Sibevin Wang; Licensed MIT */
(function() {
  angular.module("tau-utils", ["tau-switcher", "tau-checkbox-model"]);

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

      CycleSwitcher.prototype.setTab = function(tab) {
        var index;
        index = this._tabs.indexOf(tab);
        if (index !== -1) {
          return this._current_index = index;
        }
      };

      function CycleSwitcher(tabs) {
        if (tabs == null) {
          tabs = this.DEFAULT_TABS;
        }
        this.setTab = __bind(this.setTab, this);
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

  angular.module("tau-switcher").factory("PipeSwitcher", function() {
    var PipeSwitcher;
    PipeSwitcher = (function() {
      PipeSwitcher.prototype.DEFAULT_TABS = ["none"];

      PipeSwitcher.prototype._tabs = PipeSwitcher.DEFAULT_TABS;

      PipeSwitcher.prototype._current_index = 0;

      PipeSwitcher.prototype._init_index = 0;

      PipeSwitcher.prototype.next = function() {
        if (!this.isLast()) {
          return this._current_index = this._current_index + 1;
        }
      };

      PipeSwitcher.prototype.prev = function() {
        if (!this.isFirst()) {
          return this._current_index = this._current_index - 1;
        }
      };

      PipeSwitcher.prototype.reset = function() {
        return this._current_index = this._init_index;
      };

      PipeSwitcher.prototype.getTab = function() {
        return this._tabs[this._current_index];
      };

      PipeSwitcher.prototype.isTab = function(tab) {
        var _ref;
        if (tab instanceof Array) {
          return _ref = this.getTab(), __indexOf.call(tab, _ref) >= 0;
        } else {
          return tab === this.getTab();
        }
      };

      PipeSwitcher.prototype.isFirst = function() {
        return this._current_index - 1 < 0;
      };

      PipeSwitcher.prototype.isLast = function() {
        return this._current_index + 1 >= this._tabs.length;
      };

      PipeSwitcher.prototype.setTab = function(tab) {
        var index;
        index = this._tabs.indexOf(tab);
        if (index !== -1) {
          return this._current_index = index;
        }
      };

      function PipeSwitcher(tabs, init_tab) {
        if (tabs == null) {
          tabs = this.DEFAULT_TABS;
        }
        if (init_tab == null) {
          init_tab = null;
        }
        this.setTab = __bind(this.setTab, this);
        this.isLast = __bind(this.isLast, this);
        this.isFirst = __bind(this.isFirst, this);
        this.isTab = __bind(this.isTab, this);
        this.getTab = __bind(this.getTab, this);
        this.reset = __bind(this.reset, this);
        this.prev = __bind(this.prev, this);
        this.next = __bind(this.next, this);
        this._tabs = tabs;
        this._init_index = tabs.indexOf(init_tab);
        if (this._init_index === -1) {
          this._init_index = 0;
        }
        this.reset();
      }

      return PipeSwitcher;

    })();
    return PipeSwitcher;
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

(function() {
  angular.module("tau-checkbox-model", []);

}).call(this);

(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  angular.module("tau-checkbox-model").factory("CheckboxModel", function() {
    var CheckboxModel;
    CheckboxModel = (function() {
      CheckboxModel.prototype._cm_data = {
        cands: [],
        model: {}
      };

      function CheckboxModel(cm_data) {
        this.isSelected = __bind(this.isSelected, this);
        this.select = __bind(this.select, this);
        this.list = __bind(this.list, this);
        this.selectAll = __bind(this.selectAll, this);
        this._cm_data = cm_data;
      }

      CheckboxModel.prototype.selectAll = function(selected) {
        var cand, _i, _len, _ref, _results;
        if (selected == null) {
          selected = true;
        }
        _ref = this._cm_data.cands;
        _results = [];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          cand = _ref[_i];
          _results.push(this._cm_data.model[cand] = selected ? true : false);
        }
        return _results;
      };

      CheckboxModel.prototype.list = function() {
        var cand, results, _i, _len, _ref;
        results = [];
        _ref = this._cm_data.cands;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          cand = _ref[_i];
          if (this._cm_data.model[cand]) {
            results.push(cand);
          }
        }
        return results;
      };

      CheckboxModel.prototype.select = function(cand, selected) {
        if (selected == null) {
          selected = true;
        }
        if (__indexOf.call(this._cm_data.cands, cand) >= 0) {
          return this._cm_data.model[cand] = selected ? true : false;
        }
      };

      CheckboxModel.prototype.isSelected = function(cand) {
        var _i, _len, _ref;
        if (cand == null) {
          cand = null;
        }
        if (cand === null) {
          _ref = this._cm_data.cands;
          for (_i = 0, _len = _ref.length; _i < _len; _i++) {
            cand = _ref[_i];
            if (this._cm_data.model[cand]) {
              return true;
            }
          }
          return false;
        } else {
          if (__indexOf.call(this._cm_data.cands, cand) < 0) {
            return false;
          }
          if (this._cm_data.model[cand]) {
            return true;
          } else {
            return false;
          }
        }
      };

      return CheckboxModel;

    })();
    return CheckboxModel;
  });

}).call(this);
