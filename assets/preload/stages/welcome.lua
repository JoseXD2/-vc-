
local wordVoid = false
local sequence = false
local followchars = true
local modchart = true
local xx = 700
local yy = 570
local xx2 = 700
local yy2 = 570
local ofs = 50
local del = 0
local del2 = 0

local stepList = {1220, 1268, 1360, 1508, 2010, 2070, 2134}
local sequenceNumber = 0
local numbersL = {}
local void = {'V', 'O', 'I', 'D'}
local pressed = {}
local letterPos = 1
local keys = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'}
local kP = {}

local x = {}
local y = {}

function onCreate()
	precacheImage('fonts')

	makeLuaSprite('bg', 'bg/welcome', 0, 0)
	scaleObject('bg', 0.7, 0.9)
	addLuaSprite('bg', 'bg/welcome', 0, 0)

	addCharacterToList('lordX', 'dad')

	setPropertyFromClass('GameOverSubstate', 'characterName', 'tails')
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'gtfo')
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gtfo')
	setPropertyFromClass('GameOverSubstate', 'endSoundName', '')
end

function onSongStart()
    for i = 0,7 do
        local xA = getPropertyFromGroup('strumLineNotes', i, 'x')
        local yB = getPropertyFromGroup('strumLineNotes', i, 'y')
        x[i] = xA
        y[i] = yB
    end
	for i = 1,30 do
		pressed[i] = false
	end
end

function onUpdate(elapsed)
	--Mechanich

	--Detects Keys Pressed Per Frame
	for i = 1,25 do
		kP[i] = getPropertyFromClass('flixel.FlxG', 'keys.pressed.'..keys[i])
	end


	--Word Sequence

	if wordVoid then
		if kP[numbersL[1]] and letterPos == 1 then
			--DissAppearTheLetter

			doTweenAlpha('vA1', 'cross1'..sequenceNumber, 0, 0.3, 'circInOut')
			doTweenY('vY1', 'cross1'..sequenceNumber, y[4] + 100, 0.2, 'circInOut')

			doTweenAlpha('lA'..letterPos, letterPos..'letter'..void[letterPos]..sequenceNumber, 0, 0.3, 'circInOut')
			doTweenY('lY'..letterPos, letterPos..'letter'..void[letterPos]..sequenceNumber, y[letterPos+1] - 100, 0.2, 'circInOut')

			letterPos = letterPos + 1
		end
		if kP[numbersL[2]] and letterPos == 2 then
			--DissAppearTheLetter

			doTweenAlpha('vA2', 'cross2'..sequenceNumber, 0, 0.3, 'circInOut')
			doTweenY('vY2', 'cross2'..sequenceNumber, y[5] + 100, 0.2, 'circInOut')

			doTweenAlpha('lA'..letterPos, letterPos..'letter'..void[letterPos]..sequenceNumber, 0, 0.3, 'circInOut')
			doTweenY('lY'..letterPos, letterPos..'letter'..void[letterPos]..sequenceNumber, y[letterPos+1] - 100, 0.2, 'circInOut')

			letterPos = letterPos + 1
		end
		if kP[numbersL[3]] and letterPos == 3 then
			--DissAppearTheLetter

			doTweenAlpha('vA3', 'cross3'..sequenceNumber, 0, 0.3, 'circInOut')
			doTweenY('vY3', 'cross3'..sequenceNumber, y[6] + 100, 0.2, 'circInOut')

			doTweenAlpha('lA'..letterPos, letterPos..'letter'..void[letterPos]..sequenceNumber, 0, 0.3, 'circInOut')
			doTweenY('lY'..letterPos, letterPos..'letter'..void[letterPos]..sequenceNumber, y[letterPos+1] - 100, 0.2, 'circInOut')

			letterPos = letterPos + 1
		end
		if kP[numbersL[4]] and letterPos == 4 then

			--DissAppearTheLetter
			--UnStunnBF
			--LowVoidCounter (if I put one)

			doTweenAlpha('lA'..letterPos, letterPos..'letter'..void[letterPos]..sequenceNumber, 0, 0.3, 'circInOut')
			doTweenY('lY'..letterPos, letterPos..'letter'..void[letterPos]..sequenceNumber, y[letterPos+1] - 100, 0.2, 'circInOut')


			doTweenAlpha('vA4', 'cross4'..sequenceNumber, 0, 0.3, 'circInOut')
			doTweenY('vY4', 'cross4'..sequenceNumber, y[7] + 100, 0.2, 'circInOut')

			setProperty('boyfriend.stunned', false)
			letterPos = letterPos + 1
			sequence = false
			wordVoid = false
		end
	end
	--Misc Stuff

	if modchart == true then
		for i = 0,3 do
			setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
		end
	end
	if followchars == true then
		if mustHitSection == false then
		  if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
			triggerEvent('Camera Follow Pos',xx-ofs,yy)
		  end
		  if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
			triggerEvent('Camera Follow Pos',xx+ofs,yy)
		  end
		  if getProperty('dad.animation.curAnim.name') == 'singUP' then
			triggerEvent('Camera Follow Pos',xx,yy-ofs)
		  end
		  if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
			triggerEvent('Camera Follow Pos',xx,yy+ofs)
		  end
		  if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
			triggerEvent('Camera Follow Pos',xx-ofs,yy)
		  end
		  if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
			triggerEvent('Camera Follow Pos',xx+ofs,yy)
		  end
		  if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
			triggerEvent('Camera Follow Pos',xx,yy-ofs)
		  end
		  if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
			triggerEvent('Camera Follow Pos',xx,yy+ofs)
		  end
		  if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
			triggerEvent('Camera Follow Pos',xx,yy)
		  end
		  if getProperty('dad.animation.curAnim.name') == 'idle' then
			triggerEvent('Camera Follow Pos',xx,yy)
		  end
		else
		  if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
			triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
		  end
		  if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
			triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
		  end
		  if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
			triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
		  end
		  if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
			triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
		  end
		  if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
			triggerEvent('Camera Follow Pos',xx2,yy2)
		  end
		  if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
			triggerEvent('Camera Follow Pos',xx2,yy2)
		  end
		end
	else
		triggerEvent('Camera Follow Pos','','')
	end
end

function onStartCountdown()
	setProperty('gf.alpha', 0)
	setProperty('boyfriend.alpha', 0)

	return Function_Continue
end


function onVoidEvent()
	if sequence == false then
		setProperty('boyfriend.stunned', true)
		wordVoid = true
		letterPos = 1

		for i = 1,4 do
			numbersL[i] = math.floor(getRandomInt(1,25))
			void[i] = keys[numbersL[i]]

			--Makes The Xs
			makeLuaSprite('cross'..i..sequenceNumber, 'bg/cross', x[i+3] + 5, y[i+3] + 5)
			setObjectCamera('cross'..i..sequenceNumber, 'camHud')

			--Makes the Letters
			makeAnimatedLuaSprite(i..'letter'..void[i]..sequenceNumber, 'bg/fonts', x[i+3] + 5, y[i+3] + 5)
			addAnimationByPrefix(i..'letter'..void[i]..sequenceNumber, 'idle', void[i], 1, true)
			setObjectCamera(i..'letter'..void[i]..sequenceNumber, 'camHud')
			objectPlayAnimation(i..'letter'..void[i]..sequenceNumber, 'idle', true)

			--Positions them ???? MAYBE

			--SpawnsThem
			addLuaSprite('cross'..i..sequenceNumber, true)
			addLuaSprite(i..'letter'..void[i]..sequenceNumber, true)
		end
		sequence = true
	else
		setProperty('health', 0)
	end
end


function onStepHit()
	if curStep == 10 then
		modchart = false
	end
	if curStep == 992 then
		doTweenAlpha('xRevealA', 'dad', 0, 1, 'linear')
		doTweenAlpha('xRevealB', 'bg', 0, 1.2, 'linear')
		doTweenAlpha('xRevealC', 'camHUD', 0, 1, 'circInOut')
	end
	if curStep == 1098 then
		setProperty('dad.alpha', 1)
		--setProperty('cam.zoom', getProperty('cam.zoom') + 0.08)
		setProperty('dad.x', getProperty('dad.x') - 470)
		setProperty('dad.y', getProperty('dad.y') - 130)
		characterPlayAnim('dad', 'entrance')
		doTweenAlpha('xRevealD', 'camHUD', 1, 0.1, 'linear')
	end
	for i = 1,7 do
		if curStep == stepList[i] then
			onVoidEvent()
		end
	end
	if sequence and getProperty('health') > 0.4 then
		setProperty('health', getProperty('health') - 0.03*2)
	end
end

function onTweenCompleted(tag)
	if tag == 'xRevealB' then
		triggerEvent('Change Character', 1, 'lordX')
	end
end

function onGameOver()
	modchart = false
	return Function_Continue;
end

function onGameOverConfirm(retry)
	if retry then
		exitSong()
	end
end