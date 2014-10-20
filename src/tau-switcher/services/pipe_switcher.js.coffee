angular.module("tau-switcher").factory "PipeSwitcher", ->
  class PipeSwitcher
    DEFAULT_TABS: ["none"]

    _tabs: @DEFAULT_TABS
    _current_index: 0
    _init_index: 0

    next: =>
      @_current_index = @_current_index + 1 unless @isLast()

    prev: =>
      @_current_index = @_current_index - 1 unless @isFirst()

    reset: =>
      @_current_index = @_init_index

    getTab: =>
      @_tabs[@_current_index]

    isTab: (tab) =>
      if tab instanceof Array
        (@getTab() in tab)
      else
        (tab == @getTab())

    isFirst: =>
      @_current_index - 1 < 0

    isLast: =>
      @_current_index + 1 >= @_tabs.length

    setTab: (tab) =>
      index = @_tabs.indexOf(tab)
      @_current_index = index unless index == -1

    constructor: (tabs = @DEFAULT_TABS, init_tab = null) ->
      @_tabs = tabs
      @_init_index = tabs.indexOf(init_tab)
      @_init_index = 0 if @_init_index == -1
      @reset()

  return PipeSwitcher
