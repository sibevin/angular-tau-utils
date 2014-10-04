angular.module("tau-switcher").factory "TabSwitcher", ->
  class TabSwitcher
    DEFAULT_TAB: "none"

    _init_tab: @DEFAULT_TAB
    _current_tab: @DEFAULT_TAB

    reset: =>
      @_current_tab = @_init_tab

    getTab: =>
      @_current_tab

    setTab: (tab) =>
      @_current_tab = tab

    isTab: (tab) =>
      if tab instanceof Array
        (@_current_tab in tab)
      else
        (tab == @_current_tab)

    switch: (tab) =>
      if @isTab(tab)
        @reset()
      else
        @setTab(tab)

    constructor: (tab = @DEFAULT_TAB) ->
      @_init_tab = tab
      @setTab(tab)

  return TabSwitcher
