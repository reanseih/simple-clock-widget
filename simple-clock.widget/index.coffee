stylingOptions =
  # background color
  background: 'rgba(#fff, 0.2)'
  # show fullscreen -> true
  fullscreen: false
  # display position 'top', 'middle', 'bottom'
  vertical: 'bottom'

dateOptions =
  # display not only 'time' also 'date'
  showDate: false
  # format of 'date'
  date: '　%m / %d / %Y'

format = (->
  if dateOptions.showDate
    dateOptions.date + '\n' +'%H:%M:%S %p'
  else
    '%H:%M:%S %p'
)()

command: "date +\"#{format}\""

# the refresh frequency in milliseconds
refreshFrequency: 1000

# for update function
dateOptions: dateOptions

render: (output) -> """
  <div id='simpleClock'>#{output}</div>
"""

update: (output) ->
  if this.dateOptions.showDate
    data = output.split('\n')

    html = data[1]
    html += '<span class="date">'
    html += data[0]
    html += '</span>'

  else
    html = output

  $(simpleClock).html(html)

style: (->
  fontSize = '2.5em'
  width = 'auto'
  transform = 'auto'
  bottom = '47px'
  top = 'auto'

  return """
    color: #FFFFFF
    font-family: Helvetica Neue
    top: #{top}
    bottom: #{bottom}
    transform: #{transform}
    width: #{width}

    #simpleClock
      font-size: #{fontSize}
      font-weight: 100
      margin: 0
      text-align: center
      margin-left:20px

    #simpleClock .date
      font-size: .5em
  """
)()
