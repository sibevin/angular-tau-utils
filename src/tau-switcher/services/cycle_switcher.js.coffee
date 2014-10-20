angular.module("tau-switcher").factory "CycleSwitcher", ->
  class CycleSwitcher
    DEFAULT_TABS: ["none"]

    _tabs: @DEFAULT_TABS
    _current_index: 0

    next: =>
      if @_current_index + 1 >= @_tabs.length
        @_current_index = 0
      else
        @_current_index = @_current_index + 1

    prev: =>
      if @_current_index - 1 < 0
        @_current_index = @_tabs.length - 1
      else
        @_current_index = @_current_index - 1

    reset: =>
      @_current_index = 0

    getTab: =>
      @_tabs[@_current_index]

    isTab: (tab) =>
      if tab instanceof Array
        (@getTab() in tab)
      else
        (tab == @getTab())

    setTab: (tab) =>
      index = @_tabs.indexOf(tab)
      @_current_index = index unless index == -1

    constructor: (tabs = @DEFAULT_TABS) ->
      @_tabs = tabs
      @reset()

  return CycleSwitcher
