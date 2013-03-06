#$(document).ready ->
jQuery ($) ->
  fetchinFlights = null

  stub = ->
    return false

  changeTab = (e) ->
    e.preventDefault()
    e.stopPropagation()
    # используем stub для отмены перехода по ссылке
    $('#tabs li a.active').removeClass('active').unbind('click', stub).click(changeTab)
    $(this).addClass('active').unbind('click', changeTab).click(stub)
    activeDiv = $(this).attr('href')
    showFlightTable(activeDiv)

  showFlightTable = (activeDiv) ->
    $('#wrapper .cont').hide()
    if fetchinFlights
      fetchinFlights.abort()
    else
      fetchinFlights = fetchFlights(activeDiv)

  fetchFlights = (activeDiv) ->
    $.ajax('/flights/date/' + activeDiv.slice(1), {
#      data: {date: activeDiv},
      cache: false,
      timeout: 8000,
      accept: 'text/xhtml',
      beforeSend: (result) ->
        $('#error').hide()
        $('#loading').show()
      ,
      complete: (result) ->
        $('#loading').hide()
        fetchinFlights = null
      ,
      success: (result) ->
        $(activeDiv).html(result)
        $(activeDiv).show()
      ,
      error: (result) ->
        if result.statusText != 'abort'
          $('#error').show()
    })

  $('#error a').click (e) ->
    e.preventDefault()
    activeDiv = $('#tabs li a.active').attr('href')
    showFlightTable(activeDiv)

#  fetchSucc = (result, activeDiv) ->
#    $(activeDiv).html(result)
#    $(activeDiv).show()

  showNumFlights = (e) ->
    numFlights = $(this).data('flights')
    $(this).append('<span class="tooltip">' + numFlights + ' flights</span>')

  hideNumFlights = (e) ->
    $('#tabs span.tooltip').remove()

#  $('#tabs li a').click changeTab
#  $('#tabs li a').mouseenter showNumFlights
#  $('#tabs li a').mouseleave hideNumFlights
  $('#tabs li a').bind
    'click.flightSchedule': changeTab,
    'mouseenter.flightSchedule': showNumFlights,
    'mouseleave.flightSchedule': hideNumFlights

#  $('#tabs li a').hover showNumFlights
  $('#tabs li:eq(2) a').click()

  $('#wrapper').click ->
    mess = $('#tabs ul a.active').text()
    mess += ' data-flights: ' + $('#tabs ul a.active').data('flights')
    $('#output').text(mess)

  selectFlight = (e) ->
    e.preventDefault()
    $('#flights a.selected').removeClass('selected')
    $(this).addClass('selected')

    flight = $(this).data('flight')
    flightClass = $(this).data('class')
    $('#confirm').hide()

    $.ajax('/flights/' + flight, {
      data: {class: flightClass},
      dataType: 'json',
      success: showTotal
    })

  showTotal = (json) ->
    $('#price').text(json.price)
    $('#fees').text(json.fees)
    $('#total').text(json.total)
    $('#total').text(json.total)
    $('#confirm').slideDown()

#  $('#flights td a').live('click', selectFlight)
  $('#wrapper div').delegate('#flights td a', 'click', selectFlight)