GUI = GUI or {}
GUI.border_color = "#383838"
GUI.background_color = "#080808"

GUI.BackgroundCSS = CSSMan.new([[
  background-color: ]]..GUI.background_color..[[;
]])

GUI.Left = Adjustable.Container:new({
  name = "GUI.Left",
  x = 0, y = 0,
  width = "20%",
  height = "100%",
  lockStyle = "full",
  locked = true,
  autoLoad = false
})
GUI.Left.adjLabel:setStyleSheet(GUI.BackgroundCSS:getCSS())

GUI.Right = Adjustable.Container:new({
  name = "GUI.Right",
  x = "-20%", y = 0,
  width = "20%",
  height = "100%",
  lockStyle = "full",
  locked = true,
  autoLoad = false
})
GUI.Right.adjLabel:setStyleSheet(GUI.BackgroundCSS:getCSS())

GUI.Top = Adjustable.Container:new({
  name = "GUI.Top",
  x = "20%", y = 0,
  width = "60%",
  height = "10%",
  lockStyle = "full",
  locked = true,
  autoLoad = false
})
GUI.Top.adjLabel:setStyleSheet(GUI.BackgroundCSS:getCSS())

GUI.Bottom = Adjustable.Container:new({
  name = "GUI.Bottom",
  x = "20%", y = "90%",
  width = "60%",
  height = "10%",
  lockStyle = "full",
  locked = true,
  autoLoad = false
})
GUI.Bottom.adjLabel:setStyleSheet(GUI.BackgroundCSS:getCSS())

GUI.Top:attachToBorder("top")
GUI.Top:setTitle("GUI.Top")
GUI.Bottom:attachToBorder("bottom")
GUI.Bottom:setTitle("GUI.Bottom")
GUI.Left:attachToBorder("left")
GUI.Left:setTitle("GUI.Left")
GUI.Right:attachToBorder("right")
GUI.Right:setTitle("GUI.Right")

GUI.Ticker = Geyser.MiniConsole:new({
  name="GUI.Ticker",
  x=0, y=0,
  autoWrap = true,
  color = "black",
  scrollBar = false,
  fontSize = 8,
  width="100%", height="100%",
}, GUI.Left)