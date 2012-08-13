TICKS_BEFORE_THROWING_NEW_EGG = 
  2: 2.5
  3: 4
  4: 1
  5: 3
  6: 2

class @Sequencer
  constructor: (@tickDuration, @coop)->
    @coop.onReachingNewLevel (levelReached)=> @handleNewLevelReached(levelReached)

  handleNewLevelReached: (levelReached)->
    ticks = TICKS_BEFORE_THROWING_NEW_EGG[levelReached]
    setTimeout =>
      @coop.throwNewEgg()
      @tickDuration /= 2 if levelReached == 2
    , ticks * @tickDuration

  init: ->
    @coop.throwNewEgg()
    @fireNextTick()

  fireNextTick: ->
    setTimeout =>
      @coop.tick()
      @fireNextTick()
    , @tickDuration