page_app = angular.module('pageApp', ["tau-utils"])

page_app.controller "TabSwitcherExCtrl", [
  '$scope', 'TabSwitcher'
  ($scope,   TabSwitcher) ->

    $scope.ts = new TabSwitcher("home")
]

page_app.controller "BoolSwitcherExCtrl", [
  '$scope', 'BoolSwitcher'
  ($scope,   BoolSwitcher) ->

    $scope.bs = new BoolSwitcher()
]

page_app.controller "CycleSwitcherExCtrl", [
  '$scope', 'CycleSwitcher'
  ($scope,   CycleSwitcher) ->

    $scope.cs = new CycleSwitcher(["case1", "case2", "case3"])
]

page_app.controller "PipeSwitcherExCtrl", [
  '$scope', 'PipeSwitcher'
  ($scope,   PipeSwitcher) ->

    $scope.ps = new PipeSwitcher(["step1", "step2", "step3", "step4"], "step2")
]

page_app.controller "CheckboxModelExCtrl", [
  '$scope', 'CheckboxModel'
  ($scope,   CheckboxModel) ->

    $scope.roles = ["user", "manager", "admin"]
    $scope.roles_m = {}
    $scope.cm = new CheckboxModel({ cands:$scope.roles, model:$scope.roles_m })
]

angular.element(document).ready ->
  angular.bootstrap(document, ['pageApp'])
