turn = true
selected = false
boardDOM = []
boardJS = [
	0,0,0,
	0,0,0,
	0,0,0
]

winningCombo = [
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 5, 9],
    [3, 5, 7]
]
checkWin = (arr) ->
	# $.each arr, (index,value) ->
	# 	if arr[0] == 1 && arr[3] == 1 && arr[6] == 1
	# 		return alert('win')
	# 	console.log (index+1) + ' ' + value
	# for i,index in arr
	# 	if 
	# 	console.log "arr= #{index+1} " + i


document.getElementById('toogleTheme').onclick = ->
	document.body.classList.toggle('theme')
	if document.body.classList.contains('theme')
		document.getElementById('second-board').style.display = 'inline-block'
		document.getElementById('first-board').style.display = 'none'
		document.getElementById('header').style.background = '#a9a9a4'
		document.getElementById('h1').style.color = '#544F4A'
	else
		document.getElementById('second-board').style.display = 'none'
		document.getElementById('first-board').style.display = 'inline-block'
		document.getElementById('header').style.background = '#ff9'
		document.getElementById('h1').style.color = '#51c8c8'


setToken = (node, token) ->
  node.classList.add token

boardDOM = $('#first-board')
boardDOMEl= boardDOM.find('.cell')

$.each boardDOMEl, (i) ->
	boardDOMEl[i].onclick = (e) ->
		target = e.target
		token = 'cell-x'
		console.log boardDOM
		console.log i

		if target.classList.contains('cell-x') || target.classList.contains('cell-o')
			return false
		if turn
			token = 'cell-x'
			cell = 'x'
			boardJS[i] = 1
		else
			token = 'cell-o'
			cell = 'y'
			boardJS[i] = -1
		turn = !turn
		console.log boardJS
		if turn
			document.querySelector('.turn>.cell').classList.remove 'cell-o'
			document.querySelector('.turn>.cell').classList.add 'cell-x'
		else
			document.querySelector('.turn>.cell').classList.remove 'cell-x'
			document.querySelector('.turn>.cell').classList.add 'cell-o'
		checkWin boardJS
		setToken(target, token)