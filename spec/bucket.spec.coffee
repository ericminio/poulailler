describe 'A bucket', ->
  beforeEach ->
    @view =
      displayBucket: jasmine.createSpy 'displayBucket'
      eraseBucket: jasmine.createSpy 'eraseBucket'

    @bucket = new Bucket @view

  it 'can move around', ->
    expect(@bucket.position).toEqual 0

    @bucket.moveTo 2
    expect(@bucket.position).toEqual 2

  it 'displays itself', ->
    expect(@view.displayBucket).toHaveBeenCalledWith 0

  it 'can hide, too', ->
    @bucket.moveTo 2
    expect(@view.eraseBucket).toHaveBeenCalledWith 0
    expect(@view.displayBucket).toHaveBeenCalledWith 2

