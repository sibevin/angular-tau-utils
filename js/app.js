(function() {
  var page_app;

  page_app = angular.module('pageApp', ["tau-utils"]);

  page_app.controller("TabSwitcherExCtrl", [
    '$scope', 'TabSwitcher', function($scope, TabSwitcher) {
      return $scope.ts = new TabSwitcher("home");
    }
  ]);

  page_app.controller("BoolSwitcherExCtrl", [
    '$scope', 'BoolSwitcher', function($scope, BoolSwitcher) {
      return $scope.bs = new BoolSwitcher();
    }
  ]);

  page_app.controller("CycleSwitcherExCtrl", [
    '$scope', 'CycleSwitcher', function($scope, CycleSwitcher) {
      return $scope.cs = new CycleSwitcher(["case1", "case2", "case3"]);
    }
  ]);

  page_app.controller("PipeSwitcherExCtrl", [
    '$scope', 'PipeSwitcher', function($scope, PipeSwitcher) {
      return $scope.ps = new PipeSwitcher(["step1", "step2", "step3", "step4"], "step2");
    }
  ]);

  page_app.controller("CheckboxModelExCtrl", [
    '$scope', 'CheckboxModel', function($scope, CheckboxModel) {
      $scope.roles = ["user", "manager", "admin"];
      $scope.roles_m = {};
      return $scope.cm = new CheckboxModel({
        cands: $scope.roles,
        model: $scope.roles_m
      });
    }
  ]);

  angular.element(document).ready(function() {
    return angular.bootstrap(document, ['pageApp']);
  });

}).call(this);
