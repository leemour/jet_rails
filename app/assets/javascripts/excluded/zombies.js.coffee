# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
print = (obj) ->
  document.write "<div>#{obj}</div>"
#print: (obj) ->
#  document.write "<div>#{obj}</div>"

document.write('Hey')
#alert 'asd
#su = confirm('Start Engines')
#document.write("Your answer is #{su}")
#ma = prompt 'Passenger Count:'
#document.write ma
sub1 = "First Flight".toLowerCase()
print sub1
sub2 = 'Leemour'
print "The 4th letter of 'Leemour' is: '#{sub2[3]}'"
print "Hello!".replace("!", " world")
sub3 = "Hello!".replace("!", " world").split(' ')
#for sub in sub3
#  alert sub
sub4 = parseInt("42 people")
print sub4
arr = ['zero', 'one', 'two']
print arr.reverse()
if jQuery
  print 'jQuery enabled'
if $
  print '$ is used by jQuery'
print "<div id='super'><span class='elite'>Heyo!</span> this is left out</div>"
$('#super').append('<div class="append">Appended content</div>')
$('#super').prepend('<div class="append">Prepend me!!</div>')

logistics = ->
  $('#super').after('''
  <h2>Logistics</h2>
  <table id="logistics">
    <tbody>
      <tr id="time">
        <th>Time</th>
        <td>9:45AM</td>
      </tr>
      <tr id="gate">
        <th>Gate</th>
        <td>72</td>
      </tr>
      <tr id="arrives">
        <th>Arrives At</th>
        <td>20:55</td>
      </tr>
    </tbody>
  </table>
  <h2>Passengers</h2>
  <ul>
    <li>Larry Dimmick</li>
    <li>Freddy Newandyke</li>
    <li>Vic Vega</li>
  </ul>
  ''')
$(logistics)  #call document.ready
$('#logistics th').css({'text-align': 'right', 'padding': '0 5px'})
$('li:last').after('<li>Eddie Cabot</li><li>Mr. Pink</li>');
ed = $('li:last').remove()
$('li:first').before(ed)

print '<p class="yoyo">test click</p>'
print '<style>.highlight {background-color: #ffffe0;}</style>'
print '<style>.darken {background-color: #aaaaaa;}</style>'
print '<button>Ajax</button>'
print '<div id="ajax"></div>'

print '''
  <section id="tabs">
    <ul>
      <li><a href="#2012-09-27" data-flights="6">Sep 27</a></li>
      <li><a href="#2012-09-28" data-flights="5">Sep 28</a></li>
      <li><a href="#2012-09-29" data-flights="5">Sep 29</a></li>
    </ul>
  </section>
'''

$('#tabs ul li:first').html()
$('#tabs ul li:first a').attr('href')
$('#tabs ul li:first').data('flights')

onLoad = ->
  $('p').click ->
    alert "You clicked on a paragraph!
      Its text is '#{$(this).text()}'"

#  $('th').mouseenter  ->
#    $(this).addClass('highlight')
#  $('th').mouseleave  ->
#    $(this).toggleClass('highlight')
  $('th').hover( # то же, что и предыдущие строки (принимает 2 аргумента 2 функции
    ->
      $(this).addClass('highlight')
      #alert('eh!')
    ,
    ->$(this).toggleClass('highlight')
  )
  $('td').hover ->
    $(this).toggleClass('darken')

  $('body').keypress (key) ->
    code = if key.keyCode then key.keyCode else key.which
#    alert(code)
#    alert typeof code #number
    if code == 102
      alert 'You pressed \'F\'!'
  $('button').click ->
    $('#ajax').load('/zombies/ajax')

$(onLoad) # wrapping in $() replaces document.ready or document.onLoad