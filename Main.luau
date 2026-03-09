-- ts file was generated at discord.gg/25ms
-- SYNZ FIX

local module = {cache = {}}

do
    do
        local getService = function()
            local serviceName2 = function(serviceName)
                return cloneref and cloneref(game:GetService(serviceName)) or game:GetService(serviceName)
            end
            local serviceCache = {}

            setmetatable(serviceCache, {
                __index = function(tbl, key)
                    return serviceName2(key)
                end,
            })

            return serviceCache
        end

        function module.a()
            local cachedEntry = module.cache.a

            if not cachedEntry then
                cachedEntry = {
                    c = getService(),
                }
                module.cache.a = cachedEntry
            end

            return cachedEntry.c
        end
    end
    do
        local services = function()
            local getService2 = module.a()
            local players, userInput = getService2.Players, getService2.UserInputService
            local localPlayer, camera, tracer = players.LocalPlayer, workspace.CurrentCamera, {}

            function tracer:GetTracerOrigin(player)
                local originMode = player.Settings.Tracer.Origin

                if originMode == 2 then
                    return Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y)
                elseif originMode == 3 then
                    return Vector2.new(camera.ViewportSize.X / 2, 0)
                elseif originMode == 4 then
                    return Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
                elseif originMode == 5 then
                    return userInput:GetMouseLocation()
                elseif originMode == 1 and localPlayer.Character:FindFirstChild'HumanoidRootPart' then
                    local screenPos = camera:WorldToViewportPoint(localPlayer.Character.HumanoidRootPart.Position)

                    return Vector2.new(screenPos.X, screenPos.Y)
                else
                    return Vector2.new(0, 0)
                end
            end
            function tracer:GetPlayerType(player2)
                local typeStr

                if player2.Neutral then
                    typeStr = 'generic'
                else
                    if player2.TeamColor == localPlayer.TeamColor then
                        typeStr = 'friendly'
                    else
                        typeStr = 'enemy'
                    end
                end
                if player2 == localPlayer then
                    typeStr = 'local'
                end

                return typeStr
            end
            function tracer:GetPlayerColor(player3, player4, color, team, extra)
                local value

                if player4.Neutral then
                    value = 'generic'
                else
                    if player4.TeamColor == localPlayer.TeamColor then
                        value = 'friendly'
                    else
                        value = 'enemy'
                    end
                end
                if player4 == localPlayer then
                    value = 'local'
                end
                if team == 'HealthBar' and extra == 'Fill' then
                    if not player4.Character then
                        return
                    end

                    local healthSource, maxHealthSource, healthBar = player3.Settings.HealthBar.Source(player4, 'Health'), player3.Settings.HealthBar.Source(player4, 'MaxHealth'), nil

                    if healthSource / maxHealthSource > 0.65 then
                        healthBar = 'High'
                    elseif healthSource / maxHealthSource > 0.2 then
                        healthBar = 'Medium'
                    else
                        healthBar = 'Low'
                    end

                    return player3.Settings.currentColors[value].HealthBar and player3.Settings.currentColors[value].HealthBar.Fills[healthBar]
                elseif team == 'Text' then
                    return player3.Settings.currentColors[value][team]
                elseif team == 'HealthBar' and extra == 'Outline' then
                    if not player4.Character then
                        return
                    end

                    return player3.Settings.currentColors[value].HealthBar and player3.Settings.currentColors[value].HealthBar.Outline or Color3.new(0, 0, 0)
                end
                if player3.Settings.Checks.Visible.Enabled and not color then
                    if extra then
                        return player3.Settings.currentColors[value][team][extra].Invisible
                    else
                        return player3.Settings.currentColors[value][team].Invisible
                    end
                else
                    if extra then
                        return player3.Settings.currentColors[value][team][extra].Visible
                    else
                        return player3.Settings.currentColors[value][team].Visible
                    end
                end
            end
            function tracer:GetBoxCorners(player5, origin)
                local offsets = {
                    Vector3.new(-origin.X / 2, -origin.Y / 2, -origin.Z / 2),
                    Vector3.new(-origin.X / 2, -origin.Y / 2, origin.Z / 2),
                    Vector3.new(-origin.X / 2, origin.Y / 2, -origin.Z / 2),
                    Vector3.new(-origin.X / 2, origin.Y / 2, origin.Z / 2),
                    Vector3.new(origin.X / 2, -origin.Y / 2, -origin.Z / 2),
                    Vector3.new(origin.X / 2, -origin.Y / 2, origin.Z / 2),
                    Vector3.new(origin.X / 2, origin.Y / 2, -origin.Z / 2),
                    Vector3.new(origin.X / 2, origin.Y / 2, origin.Z / 2),
                }

                for index, value2 in ipairs(offsets)do
                    offsets[index] = player5:PointToWorldSpace(value2)
                end

                return offsets
            end

            return tracer
        end

        function module.b()
            local cachedB = module.cache.b

            if not cachedB then
                cachedB = {
                    c = services(),
                }
                module.cache.b = cachedB
            end

            return cachedB.c
        end
    end
    do
        local returnOne = function()
            return 1
        end

        function module.c()
            local cachedC = module.cache.c

            if not cachedC then
                cachedC = {
                    c = returnOne(),
                }
                module.cache.c = cachedC
            end

            return cachedC.c
        end
    end
    do
        local Class = function()
            local tempTable = {}

            function tempTable.new(param, param2)
                local drawing = Drawing.new(param)

                for idx, item in pairs(param2 or {})do
                    drawing[idx] = item
                end

                return drawing
            end

            return tempTable
        end

        function module.d()
            local cachedD = module.cache.d

            if not cachedD then
                cachedD = {
                    c = Class(),
                }
                module.cache.d = cachedD
            end

            return cachedD.c
        end
    end
    do
        local firstResult = function()
            local module2, method, method2, method3 = module.b(), module.c(), module.a(), module.d()
            local tracerFuncs, playerHelper, player6, originMode2, screenPos2, targetPlayer = method2.Players, workspace.CurrentCamera, {}, module2.GetTracerOrigin, module2.GetPlayerType, module2.GetPlayerColor

            function player6:CreateESP(drawSettings, target)
                local boxLines, boxEdges = screenPos2(module2, target), {
                    TopLeft = method3.new'Line',
                    TopRight = method3.new'Line',
                    BottomLeft = method3.new'Line',
                    BottomRight = method3.new'Line',
                    Left = method3.new'Line',
                    Right = method3.new'Line',
                    Top = method3.new'Line',
                    Bottom = method3.new'Line',
                }

                for loopIdx, loopVal in pairs(boxEdges)do
                    loopVal.Visible = false
                    loopVal.Color = drawSettings.Settings.currentColors[boxLines].Box.Outline.Visible
                    loopVal.Thickness = drawSettings.Settings.Box.Thickness
                end

                local tracerLine, outlineLine = method3.new('Line', {
                    Visible = false,
                    Thickness = drawSettings.Settings.Tracer.Thickness,
                    From = originMode2(module2, drawSettings),
                }), {
                    Outline = method3.new'Square',
                    Fill = method3.new'Square',
                    Text = method3.new'Text',
                }

                task.defer(function()
                    for loopKey, loopItem in pairs(outlineLine)do
                        loopItem.Visible = false

                        local temp

                        repeat
                            task.wait()
                        until target.Character

                        local healthBar2, maxHealthBar = drawSettings.Settings.HealthBar.Source(target, 'Health'), drawSettings.Settings.HealthBar.Source(target, 'MaxHealth')

                        if healthBar2 / maxHealthBar > 0.6 then
                            temp = 'High'
                        elseif healthBar2 / maxHealthBar > 0.2 then
                            temp = 'Medium'
                        else
                            temp = 'Low'
                        end
                        if not drawSettings.Settings.currentColors[boxLines].HealthBar then
                            continue
                        end
                        if loopItem == outlineLine.Fill then
                            loopItem.Color = drawSettings.Settings.currentColors[boxLines].HealthBar.Fills[temp]
                            loopItem.Filled = true
                        elseif loopItem == outlineLine.Text then
                            loopItem.Center = true
                            loopItem.Size = drawSettings.Settings.TextSize
                            loopItem.Color = drawSettings.Settings.currentColors[boxLines].HealthBar.Fills[temp]
                            loopItem.Font = 2
                        else
                            loopItem.Filled = false
                        end
                    end
                end)

                local uiElements = {
                    Name = method3.new'Text',
                    Distance = method3.new'Text',
                }

                for playerIdx, playerObj in pairs(uiElements)do
                    playerObj.Visible = false
                    playerObj.Center = true
                    playerObj.Size = drawSettings.Settings.TextSize
                    playerObj.Color = drawSettings.Settings.currentColors[boxLines].Text
                    playerObj.Font = 2
                    playerObj.Outline = true
                end

                local colorLine, highlightLine = method3.new('Line', {
                    Visible = false,
                    Color = drawSettings.Settings.currentColors[boxLines].Box.Outline.Visible,
                    Thickness = 1,
                }), Instance.new'Highlight'

                highlightLine.FillColor = drawSettings.Settings.currentColors[boxLines].Chams.Fill.Visible
                highlightLine.OutlineColor = drawSettings.Settings.currentColors[boxLines].Chams.Outline.Visible
                highlightLine.FillTransparency = drawSettings.Settings.Chams.Fill.Transparency
                highlightLine.OutlineTransparency = drawSettings.Settings.Chams.Outline.Transparency
                highlightLine.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlightLine.Enabled = false
                drawSettings.Highlights[target] = highlightLine

                local skeletonLines = {
                    Head = method3.new'Line',
                    Neck = method3.new'Line',
                    UpperSpine = method3.new'Line',
                    LowerSpine = method3.new'Line',
                    LeftShoulder = method3.new'Line',
                    LeftUpperArm = method3.new'Line',
                    LeftLowerArm = method3.new'Line',
                    LeftHand = method3.new'Line',
                    RightShoulder = method3.new'Line',
                    RightUpperArm = method3.new'Line',
                    RightLowerArm = method3.new'Line',
                    RightHand = method3.new'Line',
                    LeftHip = method3.new'Line',
                    LeftUpperLeg = method3.new'Line',
                    LeftLowerLeg = method3.new'Line',
                    LeftFoot = method3.new'Line',
                    RightHip = method3.new'Line',
                    RightUpperLeg = method3.new'Line',
                    RightLowerLeg = method3.new'Line',
                    RightFoot = method3.new'Line',
                }

                for boneIdx, boneObj in pairs(skeletonLines)do
                    boneObj.Visible = false
                    boneObj.Color = drawSettings.Settings.currentColors[boxLines].Skeleton.Visible
                    boneObj.Thickness = drawSettings.Settings.Skeleton.Thickness
                    boneObj.Transparency = drawSettings.Settings.Skeleton.Transparency
                end

                drawSettings.Drawings.Skeleton[target] = skeletonLines
                drawSettings.Drawings.ESP[target] = {
                    Box = boxEdges,
                    Tracer = tracerLine,
                    HealthBar = outlineLine,
                    Info = uiElements,
                    Snapline = colorLine,
                    Fills = {},
                }
            end
            function player6:RemoveESP(config, entity)
                local espDrawing = config.Drawings.ESP[entity]

                if espDrawing then
                    for espIdx, espObj in pairs(espDrawing.Box)do
                        pcall(espObj.Remove, espObj)
                        pcall(espObj.Destroy, espObj)
                    end

                    pcall(espDrawing.Tracer.Remove, espDrawing.Tracer)
                    pcall(espDrawing.Tracer.Destroy, espDrawing.Tracer)

                    for highlightIdx, highlightObj in pairs(espDrawing.HealthBar)do
                        pcall(highlightObj.Remove, highlightObj)
                        pcall(highlightObj.Destroy, highlightObj)
                    end
                    for skeletonIdx, skeletonObj in pairs(espDrawing.Info)do
                        pcall(skeletonObj.Remove, skeletonObj)
                        pcall(skeletonObj.Destroy, skeletonObj)
                    end
                    for healthIdx, healthObj in pairs(espDrawing.Fills)do
                        pcall(healthObj.Remove, healthObj)
                        pcall(healthObj.Destroy, healthObj)
                    end

                    pcall(espDrawing.Snapline.Remove, espDrawing.Snapline)
                    pcall(espDrawing.Snapline.Destroy, espDrawing.Snapline)

                    config.Drawings.ESP[entity] = nil
                end

                local highlight = config.Highlights[entity]

                if highlight then
                    pcall(highlight.Destroy, highlight)

                    config.Highlights[entity] = nil
                end

                local skeleton = config.Drawings.Skeleton[entity]

                if skeleton then
                    for highlightKey, highlightValue in pairs(skeleton)do
                        pcall(highlightValue.Remove, highlightValue)
                        pcall(highlightValue.Destroy, highlightValue)
                    end

                    config.Drawings.Skeleton[entity] = nil
                end
            end
            function player6:UpdateESP(settings, player7)
                if not settings.Settings.Enabled then
                    return
                end

                local espEntry = settings.Drawings.ESP[player7]

                if not espEntry then
                    return
                end

                local character = player7.Character

                if not character then
                    for charIdx, charPart in pairs(espEntry.Box)do
                        charPart.Visible = false
                    end

                    espEntry.Tracer.Visible = false

                    for partIdx, partObj in pairs(espEntry.HealthBar)do
                        partObj.Visible = false
                    end
                    for finalIdx, player8 in pairs(espEntry.Info)do
                        player8.Visible = false
                    end
                    for character2, joint in pairs(espEntry.Fills)do
                        joint.Visible = false
                    end

                    espEntry.Snapline.Visible = false

                    local bone = settings.Drawings.Skeleton[player7]

                    if bone then
                        for boneIdx2, segmentIdx in pairs(bone)do
                            segmentIdx.Visible = false
                        end
                    end

                    return
                end

                local rootPart, humanoid = character:FindFirstChild'HumanoidRootPart', character:FindFirstChild'Humanoid'

                if not rootPart or not humanoid then
                    for partIdx2, part in pairs(espEntry.Box)do
                        part.Visible = false
                    end

                    espEntry.Tracer.Visible = false

                    for connIdx, connection in pairs(espEntry.HealthBar)do
                        connection.Visible = false
                    end
                    for lineIdx, line in pairs(espEntry.Info)do
                        line.Visible = false
                    end
                    for vertexIdx, vertex in pairs(espEntry.Fills)do
                        vertex.Visible = false
                    end

                    espEntry.Snapline.Visible = false

                    local startPos = settings.Drawings.Skeleton[player7]

                    if startPos then
                        for endPos, startPos2 in pairs(startPos)do
                            startPos2.Visible = false
                        end
                    end

                    return
                end

                local screenX, screenY = playerHelper:WorldToViewportPoint(rootPart.Position)

                if not screenY then
                    for endPos2, depth in pairs(espEntry.Box)do
                        depth.Visible = false
                    end

                    espEntry.Tracer.Visible = false

                    for offsetX, offsetY in pairs(espEntry.HealthBar)do
                        offsetY.Visible = false
                    end
                    for deltaX, deltaY in pairs(espEntry.Info)do
                        deltaY.Visible = false
                    end
                    for prevPos, currPos in pairs(espEntry.Fills)do
                        currPos.Visible = false
                    end

                    espEntry.Snapline.Visible = false

                    local boneStart = settings.Drawings.Skeleton[player7]

                    if boneStart then
                        for boneEnd, color2 in pairs(boneStart)do
                            color2.Visible = false
                        end
                    end

                    return
                end
                if not humanoid or humanoid.Health <= 0 then
                    for radius, thickness in pairs(espEntry.Box)do
                        thickness.Visible = false
                    end

                    espEntry.Tracer.Visible = false

                    for angle, length in pairs(espEntry.HealthBar)do
                        length.Visible = false
                    end
                    for xPos, yPos in pairs(espEntry.Info)do
                        yPos.Visible = false
                    end
                    for zPos, wPos in pairs(espEntry.Fills)do
                        wPos.Visible = false
                    end

                    espEntry.Snapline.Visible = false

                    local segmentStart = settings.Drawings.Skeleton[player7]

                    if segmentStart then
                        for segmentEnd, segmentColor in pairs(segmentStart)do
                            segmentColor.Visible = false
                        end
                    end

                    return
                end

                local distance, isVisible = (rootPart.Position - playerHelper.CFrame.Position).Magnitude, true

                if screenY then
                    if not (#workspace.CurrentCamera:GetPartsObscuringTarget({
                        workspace.CurrentCamera.CFrame.Position,
                        rootPart.Position,
                    }, {rootPart}) == 0) then
                        isVisible = false

                        if settings.Settings.Checks.Visible.Enabled and settings.Settings.Checks.Visible.OnlyVisible then
                            for player9, index2 in pairs(espEntry.Box)do
                                index2.Visible = false
                            end

                            espEntry.Tracer.Visible = false

                            for target2, targetIdx in pairs(espEntry.HealthBar)do
                                targetIdx.Visible = false
                            end
                            for result, index3 in pairs(espEntry.Info)do
                                index3.Visible = false
                            end
                            for subIndex, outerIndex in pairs(espEntry.Fills)do
                                outerIndex.Visible = false
                            end

                            espEntry.Snapline.Visible = false

                            local boneName = settings.Drawings.Skeleton[player7]

                            if boneName then
                                for partIndex, posX in pairs(boneName)do
                                    posX.Visible = false
                                end
                            end

                            return
                        end
                    end
                end
                if not screenY or distance > settings.Settings.MaxDistance then
                    for posY, posZ in pairs(espEntry.Box)do
                        posZ.Visible = false
                    end

                    espEntry.Tracer.Visible = false

                    for uvIndex, vertexIdx2 in pairs(espEntry.HealthBar)do
                        vertexIdx2.Visible = false
                    end
                    for normalIdx, faceIdx in pairs(espEntry.Info)do
                        faceIdx.Visible = false
                    end
                    for edgeIdx, loopCounter in pairs(espEntry.Fills)do
                        loopCounter.Visible = false
                    end

                    espEntry.Snapline.Visible = false

                    local skeletonPart = settings.Drawings.Skeleton[player7]

                    if skeletonPart then
                        for drawIdx, drawX in pairs(skeletonPart)do
                            drawX.Visible = false
                        end
                    end

                    return
                end

                local targetPlayer2 = screenPos2(module2, player7)

                if settings.Settings.Checks.Team.Enabled then
                    if not settings.Settings.Checks.Team.SelectedTeams[targetPlayer2] then
                        for rayIdx, rayX in pairs(espEntry.Box)do
                            rayX.Visible = false
                        end

                        espEntry.Tracer.Visible = false

                        for rayY, rayZ in pairs(espEntry.HealthBar)do
                            rayZ.Visible = false
                        end
                        for segmentIdx2, segmentX in pairs(espEntry.Info)do
                            segmentX.Visible = false
                        end
                        for segmentY, segmentZ in pairs(espEntry.Fills)do
                            segmentZ.Visible = false
                        end

                        espEntry.Snapline.Visible = false

                        local skeletonBone = settings.Drawings.Skeleton[player7]

                        if skeletonBone then
                            for boneX, boneY in pairs(skeletonBone)do
                                boneY.Visible = false
                            end
                        end

                        return
                    end
                end

                local boxMinX, boxMinY, boxMaxX, boxMaxY, outlineColor, fillColor, thickness2, transparency, cornerRadius, offsetX2, offsetY2 = targetPlayer(module2, settings, player7, isVisible, 'Box', 'Outline'), targetPlayer(module2, settings, player7, isVisible, 'Box', 'Fill'), targetPlayer(module2, settings, player7, isVisible, 'Tracer'), targetPlayer(module2, settings, player7, isVisible, 'Text'), targetPlayer(module2, settings, player7, isVisible, 'Skeleton'), targetPlayer(module2, settings, player7, isVisible, 'Chams', 'Outline'), targetPlayer(module2, settings, player7, isVisible, 'Chams', 'Fill'), targetPlayer(module2, settings, player7, isVisible, 'HealthBar', 'Fill'), targetPlayer(module2, settings, player7, isVisible, 'HealthBar', 'Outline'), character:GetExtentsSize(), rootPart.CFrame
                local topLeftWorldPos, topRightWorldPos = playerHelper:WorldToViewportPoint(offsetY2 * CFrame.new(0, offsetX2.Y / 2, 0).Position)
                local bottomLeftWorldPos, bottomRightWorldPos = playerHelper:WorldToViewportPoint(offsetY2 * CFrame.new(0, -offsetX2.Y / 2, 0).Position)
                local centerWorldPos = playerHelper:WorldToViewportPoint(offsetY2.Position)

                if not topRightWorldPos or not bottomRightWorldPos then
                    for loopI, loopJ in pairs(espEntry.Box)do
                        loopJ.Visible = false
                    end

                    return
                end

                local depthScale = 1 / (centerWorldPos.Z * math.tan(math.rad(playerHelper.FieldOfView / 2)) * 2) * 1000
                local pixelScale, pixelOffset, centerX, centerY = math.floor(4.5 * depthScale), math.floor(6 * depthScale), math.floor(centerWorldPos.X), math.floor(centerWorldPos.Y)
                local startPos3, size = Vector2.new(math.floor(centerX - pixelScale / 2), math.floor((centerY - pixelOffset / 2) + (depthScale / 2))), Vector2.new(pixelScale, pixelOffset)

                for i, j in pairs(espEntry.Box)do
                    j.Visible = false
                end

                if settings.Settings.Box.Enabled then
                    if settings.Settings.Box.Style == 3 then
                        local rectA, rectB = {
                            TL = playerHelper:WorldToViewportPoint((offsetY2 * CFrame.new(-offsetX2.X / 2, offsetX2.Y / 2, -offsetX2.Z / 2)).Position),
                            TR = playerHelper:WorldToViewportPoint((offsetY2 * CFrame.new(offsetX2.X / 2, offsetX2.Y / 2, -offsetX2.Z / 2)).Position),
                            BL = playerHelper:WorldToViewportPoint((offsetY2 * CFrame.new(-offsetX2.X / 2, -offsetX2.Y / 2, -offsetX2.Z / 2)).Position),
                            BR = playerHelper:WorldToViewportPoint((offsetY2 * CFrame.new(offsetX2.X / 2, -offsetX2.Y / 2, -offsetX2.Z / 2)).Position),
                        }, {
                            TL = playerHelper:WorldToViewportPoint((offsetY2 * CFrame.new(-offsetX2.X / 2, offsetX2.Y / 2, offsetX2.Z / 2)).Position),
                            TR = playerHelper:WorldToViewportPoint((offsetY2 * CFrame.new(offsetX2.X / 2, offsetX2.Y / 2, offsetX2.Z / 2)).Position),
                            BL = playerHelper:WorldToViewportPoint((offsetY2 * CFrame.new(-offsetX2.X / 2, -offsetX2.Y / 2, offsetX2.Z / 2)).Position),
                            BR = playerHelper:WorldToViewportPoint((offsetY2 * CFrame.new(offsetX2.X / 2, -offsetX2.Y / 2, offsetX2.Z / 2)).Position),
                        }

                        if not (rectA.TL.Z > 0 and rectA.TR.Z > 0 and rectA.BL.Z > 0 and rectA.BR.Z > 0 and rectB.TL.Z > 0 and rectB.TR.Z > 0 and rectB.BL.Z > 0 and rectB.BR.Z > 0) then
                            for k, l in pairs(espEntry.Box)do
                                l.Visible = false
                            end

                            return
                        end

                        local vec2 = function(vec)
                            return Vector2.new(vec.X, vec.Y)
                        end

                        rectA.TL, rectA.TR = vec2(rectA.TL), vec2(rectA.TR)
                        rectA.BL, rectA.BR = vec2(rectA.BL), vec2(rectA.BR)
                        rectB.TL, rectB.TR = vec2(rectB.TL), vec2(rectB.TR)
                        rectB.BL, rectB.BR = vec2(rectB.BL), vec2(rectB.BR)
                        espEntry.Box.TopLeft.From = rectA.TL
                        espEntry.Box.TopLeft.To = rectA.TR
                        espEntry.Box.TopLeft.Visible = true
                        espEntry.Box.TopRight.From = rectA.TR
                        espEntry.Box.TopRight.To = rectA.BR
                        espEntry.Box.TopRight.Visible = true
                        espEntry.Box.BottomLeft.From = rectA.BL
                        espEntry.Box.BottomLeft.To = rectA.BR
                        espEntry.Box.BottomLeft.Visible = true
                        espEntry.Box.BottomRight.From = rectA.TL
                        espEntry.Box.BottomRight.To = rectA.BL
                        espEntry.Box.BottomRight.Visible = true
                        espEntry.Box.Left.From = rectB.TL
                        espEntry.Box.Left.To = rectB.TR
                        espEntry.Box.Left.Visible = true
                        espEntry.Box.Right.From = rectB.TR
                        espEntry.Box.Right.To = rectB.BR
                        espEntry.Box.Right.Visible = true
                        espEntry.Box.Top.From = rectB.BL
                        espEntry.Box.Top.To = rectB.BR
                        espEntry.Box.Top.Visible = true
                        espEntry.Box.Bottom.From = rectB.TL
                        espEntry.Box.Bottom.To = rectB.BL
                        espEntry.Box.Bottom.Visible = true

                        local startPoint = function(point, x, y)
                            return method3.new('Line', {
                                Visible = y,
                                Color = boxMinX,
                                Thickness = settings.Settings.Box.Thickness,
                                From = point,
                                To = x,
                            })
                        end
                        local options = function(endPoint, lineProps, depth2, unused, alpha)
                            local v1 = function(beta, gamma)
                                return beta.X * gamma.X + beta.Y * gamma.Y
                            end
                            local vec3 = function(v2)
                                return math.sqrt(v2.X * v2.X + v2.Y * v2.Y)
                            end
                            local vec5 = function(vec4)
                                local length2 = vec3(vec4)

                                if length2 == 0 then
                                    return Vector2.new(0, 0)
                                end

                                return Vector2.new(vec4.X / length2, vec4.Y / length2)
                            end
                            local delta2 = function()
                                local delta = depth2 - endPoint
                                local dist = vec3(delta)

                                if dist == 0 then
                                    local perp, mid = (endPoint + unused) * 0.5, (lineProps + depth2) * 0.5

                                    return perp, mid, 1
                                end

                                local perp2 = Vector2.new(-delta.Y, delta.X)
                                local rotated = vec5(perp2)

                                if rotated.X == 0 and rotated.Y == 0 then
                                    return (endPoint + unused) * 0.5, (lineProps + depth2) * 0.5, 1
                                end

                                local dx, dy = math.abs(v1(unused - endPoint, rotated)), math.abs(v1(lineProps - depth2, rotated))
                                local center, midX, midY = (dx + dy) * 0.5, (endPoint + lineProps) * 0.5, (unused + depth2) * 0.5

                                return midX, midY, center
                            end
                            local result2, output, temp2 = delta2()
                            local fills, stroke, gradient = espEntry.Fills or {}, alpha, nil

                            if fills[stroke] and fills[stroke].Position == nil then
                                gradient = fills[stroke]
                            else
                                gradient = method3.new'Line'
                                fills[stroke] = gradient
                            end

                            gradient.Visible = isVisible and settings.Settings.Box.Filled.Enabled or false
                            gradient.Color = boxMinY
                            gradient.Transparency = settings.Settings.Box.Filled.Transparency
                            gradient.Thickness = temp2
                            gradient.From = result2
                            gradient.To = output
                            espEntry.Fills = fills

                            return gradient
                        end

                        options(rectA.TL, rectA.TR, rectA.BL, rectA.BR, 1)
                        options(rectB.TL, rectB.TR, rectB.BL, rectB.BR, 2)
                        options(rectA.TL, rectB.TL, rectA.BL, rectB.BL, 3)
                        options(rectA.TR, rectB.TR, rectA.BR, rectB.BR, 4)
                        options(rectA.TL, rectA.TR, rectB.TR, rectB.TL, 5)
                        options(rectA.BL, rectA.BR, rectB.BR, rectB.BL, 6)

                        local drawLine = {
                            startPoint(rectA.TL, rectB.TL, true),
                            startPoint(rectA.TR, rectB.TR, true),
                            startPoint(rectA.BL, rectB.BL, true),
                            startPoint(rectA.BR, rectB.BR, true),
                        }

                        task.defer(function()
                            task.wait(settings.Settings.Framerate or 1.6666666666666665E-2)

                            for index4, i2 in ipairs(drawLine)do
                                pcall(i2.Remove, i2)
                                pcall(i2.Destroy, i2)
                            end
                        end)
                    else
                        local target3 = function(obj, data)
                            local fills2, startIdx, endIdx = espEntry.Fills or {}, 1, nil

                            -- Use a pcall or a direct check to see if we can reuse the object
                            if fills2[startIdx] then
                                -- Check if it's the right type for a Square (which has 'Size')
                                -- This replaces the problematic line 812
                                local success = pcall(function() return fills2[startIdx].Size end)
                                if success then
                                    endIdx = fills2[startIdx]
                                else
                                    -- If it's the wrong type (like a Line), remove it and make a Square
                                    fills2[startIdx]:Remove()
                                    endIdx = method3.new'Square'
                                    fills2[startIdx] = endIdx
                                end
                            else
                                endIdx = method3.new'Square'
                                fills2[startIdx] = endIdx
                            end
                        end

                        target3(startPos3, startPos3 + Vector2.new(size.X, size.Y))

                        if settings.Settings.Box.Style == 1 then
                            local scale = pixelScale * 0.2

                            espEntry.Box.TopLeft.From = startPos3
                            espEntry.Box.TopLeft.To = startPos3 + Vector2.new(scale, 0)
                            espEntry.Box.TopLeft.Visible = true
                            espEntry.Box.TopRight.From = startPos3 + Vector2.new(size.X, 0)
                            espEntry.Box.TopRight.To = startPos3 + Vector2.new(size.X - scale, 0)
                            espEntry.Box.TopRight.Visible = true
                            espEntry.Box.BottomLeft.From = startPos3 + Vector2.new(0, size.Y)
                            espEntry.Box.BottomLeft.To = startPos3 + Vector2.new(scale, size.Y)
                            espEntry.Box.BottomLeft.Visible = true
                            espEntry.Box.BottomRight.From = startPos3 + Vector2.new(size.X, size.Y)
                            espEntry.Box.BottomRight.To = startPos3 + Vector2.new(size.X - scale, size.Y)
                            espEntry.Box.BottomRight.Visible = true
                            espEntry.Box.Left.From = startPos3
                            espEntry.Box.Left.To = startPos3 + Vector2.new(0, scale)
                            espEntry.Box.Left.Visible = true
                            espEntry.Box.Right.From = startPos3 + Vector2.new(size.X, 0)
                            espEntry.Box.Right.To = startPos3 + Vector2.new(size.X, scale)
                            espEntry.Box.Right.Visible = true
                            espEntry.Box.Top.From = startPos3 + Vector2.new(0, size.Y)
                            espEntry.Box.Top.To = startPos3 + Vector2.new(0, size.Y - scale)
                            espEntry.Box.Top.Visible = true
                            espEntry.Box.Bottom.From = startPos3 + Vector2.new(size.X, size.Y)
                            espEntry.Box.Bottom.To = startPos3 + Vector2.new(size.X, size.Y - scale)
                            espEntry.Box.Bottom.Visible = true
                        else
                            espEntry.Box.Left.From = startPos3
                            espEntry.Box.Left.To = startPos3 + Vector2.new(0, size.Y)
                            espEntry.Box.Left.Visible = true
                            espEntry.Box.Right.From = startPos3 + Vector2.new(size.X, 0)
                            espEntry.Box.Right.To = startPos3 + Vector2.new(size.X, size.Y)
                            espEntry.Box.Right.Visible = true
                            espEntry.Box.Top.From = startPos3
                            espEntry.Box.Top.To = startPos3 + Vector2.new(size.X, 0)
                            espEntry.Box.Top.Visible = true
                            espEntry.Box.Bottom.From = startPos3 + Vector2.new(0, size.Y)
                            espEntry.Box.Bottom.To = startPos3 + Vector2.new(size.X, size.Y)
                            espEntry.Box.Bottom.Visible = true
                            espEntry.Box.TopLeft.Visible = false
                            espEntry.Box.TopRight.Visible = false
                            espEntry.Box.BottomLeft.Visible = false
                            espEntry.Box.BottomRight.Visible = false
                        end
                    end

                    for index5, value3 in pairs(espEntry.Box)do
                        if value3.Visible then
                            value3.Color = boxMinX
                            value3.Thickness = settings.Settings.Box.Thickness
                        end
                    end
                end
                if settings.Settings.Tracer.Enabled[targetPlayer2] then
                    espEntry.Tracer.From = originMode2(module2, settings)
                    espEntry.Tracer.To = Vector2.new(screenX.X, screenX.Y)
                    espEntry.Tracer.Color = boxMaxX
                    espEntry.Tracer.Visible = true
                else
                    espEntry.Tracer.Visible = false
                end
                if settings.Settings.HealthBar.Enabled[targetPlayer2] then
                    local character3, stat = settings.Settings.HealthBar.Source(player7, 'Health'), settings.Settings.HealthBar.Source(player7, 'MaxHealth')
                    local ratio, max, offset = character3 / stat, size.Y, 4
                    local barX = settings.Settings.HealthBar.Position == 1 and (startPos3.X - offset - 4) or (startPos3.X + offset + 4 + size.X)
                    local barPos = Vector2.new(barX, startPos3.Y)

                    if settings.Settings.HealthBar.Bar then
                        espEntry.HealthBar.Outline.Size = Vector2.new(offset, max)
                        espEntry.HealthBar.Outline.Position = barPos
                        espEntry.HealthBar.Outline.Visible = true
                        espEntry.HealthBar.Outline.Color = cornerRadius
                        espEntry.HealthBar.Fill.Size = Vector2.new(offset - 2, (max - 2) * ratio)
                        espEntry.HealthBar.Fill.Position = Vector2.new(barPos.X + 1, barPos.Y + 1 + ((max - 2) * (1 - ratio)))
                        espEntry.HealthBar.Fill.Color = transparency
                        espEntry.HealthBar.Fill.Visible = true
                    else
                        espEntry.HealthBar.Outline.Visible = false
                        espEntry.HealthBar.Fill.Visible = false
                    end
                    if settings.Settings.HealthBar.Text then
                        espEntry.HealthBar.Text.Text = math.floor(character3) .. settings.Settings.HealthBar.Suffix
                        espEntry.HealthBar.Text.Position = Vector2.new(barPos.X + offset + 2, barPos.Y + max)
                        espEntry.HealthBar.Text.Visible = true
                    else
                        espEntry.HealthBar.Text.Visible = false
                    end
                else
                    for i22, item2 in pairs(espEntry.HealthBar)do
                        item2.Visible = false
                    end
                end
                if settings.Settings.Name.Enabled[targetPlayer2] then
                    espEntry.Info.Name.Text = settings.Settings.Name.Style == 2 and player7.Name or player7.DisplayName
                    espEntry.Info.Name.Position = Vector2.new(startPos3.X + pixelScale / 2, startPos3.Y - 20)
                    espEntry.Info.Name.Color = boxMaxY
                    espEntry.Info.Name.Visible = true
                else
                    espEntry.Info.Name.Visible = false
                end
                if settings.Settings.Distance.Enabled[targetPlayer2] then
                    local numStr = tonumber(distance)

                    if settings.Settings.Distance.DistanceUnit == 2 then
                        numStr = distance * 0.28
                    end

                    espEntry.Info.Name.Text = tostring(math.round(numStr * 10) / 10) .. ' ' .. (settings.Settings.Distance.DistanceUnit == 2 and 'meters' or 'studs')
                    espEntry.Info.Name.Position = Vector2.new(startPos3.X + pixelScale / 2, startPos3.Y + size.Y)
                    espEntry.Info.Name.Color = boxMaxY
                    espEntry.Info.Name.Visible = true
                else
                    espEntry.Info.Name.Visible = false
                end
                if settings.Settings.Snaplines then
                    espEntry.Snapline.From = Vector2.new(playerHelper.ViewportSize.X / 2, playerHelper.ViewportSize.Y)
                    espEntry.Snapline.To = Vector2.new(screenX.X, screenX.Y)
                    espEntry.Snapline.Color = boxMinX
                    espEntry.Snapline.Visible = false
                end

                local highlightObj2 = settings.Highlights[player7]

                if highlightObj2 then
                    if settings.Settings.Chams.Enabled[targetPlayer2] and character then
                        highlightObj2.Parent = character
                        highlightObj2.FillColor = thickness2
                        highlightObj2.OutlineColor = fillColor
                        highlightObj2.FillTransparency = settings.Settings.Chams.Fill.Enabled and settings.Settings.Chams.Fill.Transparency or 1
                        highlightObj2.OutlineTransparency = settings.Settings.Chams.Outline.Enabled and settings.Settings.Chams.Outline.Transparency or 1
                        highlightObj2.Enabled = true
                    else
                        highlightObj2.Enabled = false
                    end

                    highlightObj2.DepthMode = settings.Settings.Chams.Occlusion and Enum.HighlightDepthMode.Occluded or Enum.HighlightDepthMode.AlwaysOnTop
                end
                if settings.Settings.Skeleton.Enabled[targetPlayer2] then
                    local targetObj = function()
                        if not character then
                            return nil
                        end

                        local upperTorso = {
                            Head = character:FindFirstChild'Head',
                            UpperTorso = character:FindFirstChild'UpperTorso' or character:FindFirstChild'Torso',
                            LowerTorso = character:FindFirstChild'LowerTorso' or character:FindFirstChild'Torso',
                            RootPart = character:FindFirstChild'HumanoidRootPart',
                            LeftUpperArm = character:FindFirstChild'LeftUpperArm' or character:FindFirstChild'Left Arm',
                            LeftLowerArm = character:FindFirstChild'LeftLowerArm' or character:FindFirstChild'Left Arm',
                            LeftHand = character:FindFirstChild'LeftHand' or character:FindFirstChild'Left Arm',
                            RightUpperArm = character:FindFirstChild'RightUpperArm' or character:FindFirstChild'Right Arm',
                            RightLowerArm = character:FindFirstChild'RightLowerArm' or character:FindFirstChild'Right Arm',
                            RightHand = character:FindFirstChild'RightHand' or character:FindFirstChild'Right Arm',
                            LeftUpperLeg = character:FindFirstChild'LeftUpperLeg' or character:FindFirstChild'Left Leg',
                            LeftLowerLeg = character:FindFirstChild'LeftLowerLeg' or character:FindFirstChild'Left Leg',
                            LeftFoot = character:FindFirstChild'LeftFoot' or character:FindFirstChild'Left Leg',
                            RightUpperLeg = character:FindFirstChild'RightUpperLeg' or character:FindFirstChild'Right Leg',
                            RightLowerLeg = character:FindFirstChild'RightLowerLeg' or character:FindFirstChild'Right Leg',
                            RightFoot = character:FindFirstChild'RightFoot' or character:FindFirstChild'Right Leg',
                        }

                        if not (upperTorso.Head and upperTorso.UpperTorso) then
                            return nil
                        end

                        return upperTorso
                    end
                    local callback = function(part2, parent, offsetVal)
                        if not part2 or not parent then
                            offsetVal.Visible = false

                            return
                        end

                        local worldPos, screenPos3 = (part2.CFrame * CFrame.new(0, 0, 0)).Position, (parent.CFrame * CFrame.new(0, 0, 0)).Position
                        local screenPoint, depth3 = playerHelper:WorldToViewportPoint(worldPos)
                        local screenPoint2, depth22 = playerHelper:WorldToViewportPoint(screenPos3)

                        if not (depth3 and depth22) or screenPoint.Z < 0 or screenPoint2.Z < 0 then
                            offsetVal.Visible = false

                            return
                        end

                        local viewportSize = playerHelper.ViewportSize

                        if screenPoint.X < 0 or screenPoint.X > viewportSize.X or screenPoint.Y < 0 or screenPoint.Y > viewportSize.Y or screenPoint2.X < 0 or screenPoint2.X > viewportSize.X or screenPoint2.Y < 0 or screenPoint2.Y > viewportSize.Y then
                            offsetVal.Visible = false

                            return
                        end

                        offsetVal.From = Vector2.new(screenPoint.X, screenPoint.Y)
                        offsetVal.To = Vector2.new(screenPoint2.X, screenPoint2.Y)
                        offsetVal.Color = outlineColor
                        offsetVal.Thickness = settings.Settings.Skeleton.Thickness
                        offsetVal.Transparency = settings.Settings.Skeleton.Transparency
                        offsetVal.Visible = true
                    end
                    local func = targetObj(character)

                    if func then
                        local skeleton2 = settings.Drawings.Skeleton[player7]

                        if skeleton2 then
                            callback(func.Head, func.UpperTorso, skeleton2.Head)
                            callback(func.UpperTorso, func.LowerTorso, skeleton2.UpperSpine)
                            callback(func.UpperTorso, func.LeftUpperArm, skeleton2.LeftShoulder)
                            callback(func.LeftUpperArm, func.LeftLowerArm, skeleton2.LeftUpperArm)
                            callback(func.LeftLowerArm, func.LeftHand, skeleton2.LeftLowerArm)
                            callback(func.UpperTorso, func.RightUpperArm, skeleton2.RightShoulder)
                            callback(func.RightUpperArm, func.RightLowerArm, skeleton2.RightUpperArm)
                            callback(func.RightLowerArm, func.RightHand, skeleton2.RightLowerArm)
                            callback(func.LowerTorso, func.LeftUpperLeg, skeleton2.LeftHip)
                            callback(func.LeftUpperLeg, func.LeftLowerLeg, skeleton2.LeftUpperLeg)
                            callback(func.LeftLowerLeg, func.LeftFoot, skeleton2.LeftLowerLeg)
                            callback(func.LowerTorso, func.RightUpperLeg, skeleton2.RightHip)
                            callback(func.RightUpperLeg, func.RightLowerLeg, skeleton2.RightUpperLeg)
                            callback(func.RightLowerLeg, func.RightFoot, skeleton2.RightLowerLeg)
                        end
                    end
                else
                    local drawings = settings.Drawings.Skeleton[player7]

                    if drawings then
                        for i3, v in pairs(drawings)do
                            v.Visible = false
                        end
                    end
                end
            end

            return player6
        end

        function module.e()
            local cacheEntry = module.cache.e

            if not cacheEntry then
                cacheEntry = {
                    c = firstResult(),
                }
                module.cache.e = cacheEntry
            end

            return cacheEntry.c
        end
    end
    do
        local esp = function()
            local config2 = {}

            config2.EspObjects = {}
            config2.ExistingESPs = {}

            local resultA, resultB, resultC, resultD = module.a(), module.b(), module.d(), module.c()
            local services2, runService, guiService, playersService, services3 = resultA.Players, resultA.RunService, resultA.UserInputService, resultA.GuiService, workspace.CurrentCamera
            local localPlayer2 = services2.LocalPlayer
            local mouse, playerColor = localPlayer2:GetMouse(), resultB.GetPlayerColor

            function config2:init(serviceName3)
                config2:updateobjectlist(serviceName3)

                config2.Library = serviceName3
            end
            function config2:updateobjectlist(callback2)
                config2.EspObjects = {}

                for index6, item3 in pairs(callback2.ObjectESPs.ESPs)do
                    table.insert(config2.EspObjects, index6)

                    if not table.find(config2.ExistingESPs, index6) then
                        config2:PlaceObjectDot(index6)
                    end
                end
            end

            task.defer(function()
                repeat
                    task.wait()
                until localPlayer2.Character ~= nil and localPlayer2.Character.HumanoidRootPart ~= nil and config2.Library

                local position = function(value4, paramC, paramD, paramE, paramF, paramG)
                    return resultC.new('Circle', {
                        Transparency = value4,
                        Color = paramC,
                        Visible = false,
                        Thickness = paramF,
                        Position = Vector2.new(0, 0),
                        Radius = paramD,
                        NumSides = math.clamp(paramD * 55 / 100, 10, 75),
                        Filled = paramE,
                        ZIndex = paramG or 5,
                    })
                end
                local backgroundColor = position(0.9, config2.Library.Settings.currentColors.Radar.Background, config2.Library.Settings.Radar.Radius, true, 1, 4)

                backgroundColor.Visible = true
                backgroundColor.Position = config2.Library.Settings.Radar.Position

                local borderColor = position(0.75, config2.Library.Settings.currentColors.Radar.Border, config2.Library.Settings.Radar.Radius, false, 3, 4)

                borderColor.Visible = true
                borderColor.Position = config2.Library.Settings.Radar.Position

                local targetModel = function(filled)
                    local character4 = localPlayer2.Character

                    if character4 and character4:FindFirstChild'HumanoidRootPart' then
                        local rootPart2 = character4.HumanoidRootPart
                        local targetPos = Vector3.new(services3.CFrame.Position.X, rootPart2.Position.Y, services3.CFrame.Position.Z)
                        local lookCFrame = CFrame.new(rootPart2.Position, targetPos)
                        local pointInSpace = lookCFrame:PointToObjectSpace(filled)

                        return pointInSpace.X, pointInSpace.Z
                    else
                        return 0, 0
                    end
                end
                local callback3 = function(characterParam)
                    task.defer(function()
                        repeat
                            task.wait()
                        until characterParam.Character

                        local screenPos4, depth4 = services3:WorldToViewportPoint(characterParam.Character.HumanoidRootPart.Position)
                        local shapeSize = position(1, playerColor(resultB, config2.Library, characterParam, depth4, 'Box', 'Outline'), 3, true, 1)
                        local renderStepConn = function()
                            local tempVar

                            tempVar = runService.RenderStepped:Connect(function()
                                local character5 = characterParam.Character

                                if character5 and character5:FindFirstChildOfClass'Humanoid' and character5:FindFirstChild'HumanoidRootPart' and character5:FindFirstChild'Humanoid'.Health > 0 then
                                    local humanoid2, radarScale, offsetX3, offsetY3 = character5:FindFirstChildOfClass'Humanoid', config2.Library.Settings.Radar.Scale, targetModel(character5.HumanoidRootPart.Position)
                                    local radarPos = config2.Library.Settings.Radar.Position - Vector2.new(offsetX3 * radarScale, offsetY3 * radarScale)

                                    if (radarPos - config2.Library.Settings.Radar.Position).magnitude < config2.Library.Settings.Radar.Radius - 2 then
                                        shapeSize.Radius = 3
                                        shapeSize.Position = radarPos
                                        shapeSize.Visible = true
                                    else
                                        local distance2 = (config2.Library.Settings.Radar.Position - radarPos).magnitude
                                        local direction = (config2.Library.Settings.Radar.Position - radarPos).unit * (distance2 - config2.Library.Settings.Radar.Radius)
                                        local finalPos = Vector2.new(radarPos.X + direction.X, radarPos.Y + direction.Y)

                                        shapeSize.Radius = 2
                                        shapeSize.Position = finalPos
                                        shapeSize.Visible = true
                                    end

                                    shapeSize.Color = playerColor(resultB, config2.Library, characterParam, depth4, 'Box', 'Outline')
                                    shapeSize.Visible = true

                                    if not config2.Library.Settings.Radar.Enabled then
                                        shapeSize.Visible = false
                                    end
                                else
                                    shapeSize.Visible = false

                                    if services2:FindFirstChild(characterParam.Name) == nil then
                                        pcall(shapeSize.Destroy, shapeSize)
                                        pcall(shapeSize.Remove, shapeSize)
                                        tempVar:Disconnect()

                                        tempVar = nil
                                    end
                                end
                            end)

                            table.insert(config2.Library._connections, tempVar)
                        end

                        coroutine.wrap(renderStepConn)()
                    end)
                end

                for loopItem2, loopIndex in pairs(services2:GetChildren())do
                    if loopIndex ~= localPlayer2 then
                        callback3(loopIndex)
                    end
                end

                local placeholder = nil
                local triangle = function()
                    local thickness3 = resultC.new('Triangle', {
                        Visible = true,
                        Thickness = 1,
                        Filled = true,
                        Color = playerColor(resultB, config2.Library, localPlayer2, true, 'Box', 'Outline'),
                        PointA = config2.Library.Settings.Radar.Position + Vector2.new(0, -6),
                        PointB = config2.Library.Settings.Radar.Position + Vector2.new(-3, 6),
                        PointC = config2.Library.Settings.Radar.Position + Vector2.new(3, 6),
                        ZIndex = 5,
                    })

                    coroutine.wrap(function()
                        if placeholder then
                            placeholder:Disconnect()
                        end

                        placeholder = runService.RenderStepped:Connect(function()
                            thickness3.Visible = true

                            if not config2.Library.Settings.Radar.Enabled then
                                thickness3.Visible = false
                            end
                        end)
                        config2.Library._connections.currentlocaldotc = placeholder
                    end)()

                    return thickness3
                end
                local result3 = triangle()

                table.insert(config2.Library._connections, services2.PlayerAdded:Connect(function(paramJ)
                    if paramJ ~= localPlayer2 then
                        callback3(paramJ)
                    end

                    pcall(result3.Destroy, result3)
                    pcall(result3.Remove, result3)

                    result3 = triangle()
                end))

                function config2:PlaceObjectDot(paramJ2)
                    table.insert(config2.ExistingESPs, paramJ2)

                    local boundingBox = paramJ2:IsA'Model' and paramJ2:GetBoundingBox() or paramJ2.Position
                    local screenPoint3, worldPos2 = services3:WorldToViewportPoint(boundingBox)
                    local neutralTeam = {Neutral = true}
                    local square = resultC.new('Square', {
                        Transparency = 1,
                        Color = playerColor(resultB, config2.Library, neutralTeam, worldPos2, 'Box', 'Outline'),
                        Visible = false,
                        Thickness = 1,
                        Position = Vector2.new(0, 0),
                        Size = Vector2.new(6, 6),
                        Filled = true,
                        ZIndex = 5,
                    })
                    local renderConn = function()
                        local player10

                        player10 = runService.RenderStepped:Connect(function()
                            if paramJ2 then
                                local scale2, offsetX4, offsetY4 = config2.Library.Settings.Radar.Scale, targetModel(boundingBox)
                                local radarBasePos = config2.Library.Settings.Radar.Position - Vector2.new(offsetX4 * scale2, offsetY4 * scale2)

                                if (radarBasePos - config2.Library.Settings.Radar.Position).magnitude < config2.Library.Settings.Radar.Radius - 2 then
                                    square.Size = Vector2.new(6, 6)
                                    square.Position = radarBasePos - Vector2.new(3, 3)
                                    square.Visible = true
                                else
                                    local centerDist = (config2.Library.Settings.Radar.Position - radarBasePos).magnitude
                                    local directionVector = (config2.Library.Settings.Radar.Position - radarBasePos).unit * (centerDist - config2.Library.Settings.Radar.Radius)
                                    local radarPoint = Vector2.new(radarBasePos.X + directionVector.X, radarBasePos.Y + directionVector.Y)

                                    square.Size = Vector2.new(4, 4)
                                    square.Position = radarPoint - Vector2.new(2, 2)
                                    square.Visible = true
                                end

                                square.Color = playerColor(resultB, config2.Library, neutralTeam, worldPos2, 'Box', 'Outline')
                                square.Visible = true

                                if not config2.Library.Settings.Radar.Enabled then
                                    square.Visible = false
                                end
                            else
                                square.Visible = false

                                pcall(square.Destroy, square)
                                pcall(square.Remove, square)
                                table.remove(config2.ExistingESPs, table.find(config2.ExistingESPs, paramJ2))
                                player10:Disconnect()
                            end
                        end)

                        table.insert(config2.Library._connections, player10)
                    end

                    coroutine.wrap(renderConn)()
                end

                local guiInset, offsetEnabled, offsetVec = playersService:GetGuiInset(), false, Vector2.new(0, 0)

                guiService.InputBegan:Connect(function(value5)
                    if value5.UserInputType == Enum.UserInputType.MouseButton1 and (Vector2.new(mouse.X, mouse.Y + guiInset.Y) - config2.Library.Settings.Radar.Position).magnitude < config2.Library.Settings.Radar.Radius then
                        offsetVec = config2.Library.Settings.Radar.Position - Vector2.new(mouse.X, mouse.Y)
                        offsetEnabled = true
                    end
                end)
                guiService.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        offsetEnabled = false
                    end
                end)
                coroutine.wrap(function()
                    local moduleVar

                    moduleVar = runService.RenderStepped:Connect(function()
                        if offsetEnabled then
                            config2.Library.Settings.Radar.Position = Vector2.new(mouse.X, mouse.Y) + offsetVec
                        end
                    end)

                    table.insert(config2.Library._connections, moduleVar)
                end)()
                coroutine.wrap(function()
                    local memberVar

                    memberVar = runService.RenderStepped:Connect(function()
                        if not config2.Library then
                            return
                        end
                        if result3 ~= nil then
                            result3.Color = playerColor(resultB, config2.Library, localPlayer2, true, 'Box', 'Outline')
                            result3.PointA = config2.Library.Settings.Radar.Position + Vector2.new(0, -6)
                            result3.PointB = config2.Library.Settings.Radar.Position + Vector2.new(-3, 6)
                            result3.PointC = config2.Library.Settings.Radar.Position + Vector2.new(3, 6)
                        end

                        backgroundColor.Position = config2.Library.Settings.Radar.Position
                        backgroundColor.Radius = config2.Library.Settings.Radar.Radius
                        backgroundColor.Color = config2.Library.Settings.currentColors.Radar.Background
                        borderColor.Position = config2.Library.Settings.Radar.Position
                        borderColor.Radius = config2.Library.Settings.Radar.Radius
                        borderColor.Color = config2.Library.Settings.currentColors.Radar.Border

                        if not config2.Library.Settings.Radar.Enabled then
                            borderColor.Visible = false
                            backgroundColor.Visible = false
                        else
                            borderColor.Visible = true
                            backgroundColor.Visible = true
                        end
                    end)

                    table.insert(config2.Library._connections, memberVar)
                end)()
            end)

            return config2
        end

        function module.f()
            local cachedF = module.cache.f

            if not cachedF then
                cachedF = {
                    c = esp(),
                }
                module.cache.f = cachedF
            end

            return cachedF.c
        end
    end
    do
        local module3 = function()
            local settingsTable = {}

            settingsTable.__index = settingsTable

            local services4, playerService, runService2, lightingService = module.c(), module.d(), module.b(), workspace.CurrentCamera
            local tracerUtil, colorUtil = runService2.GetTracerOrigin, runService2.GetPlayerColor

            function settingsTable.CreateESP(settings2, player11, camera2)
                local teamLabel, teamLabelAlt = 'generic', {
                    TopLeft = playerService.new'Line',
                    TopRight = playerService.new'Line',
                    BottomLeft = playerService.new'Line',
                    BottomRight = playerService.new'Line',
                    Left = playerService.new'Line',
                    Right = playerService.new'Line',
                    Top = playerService.new'Line',
                    Bottom = playerService.new'Line',
                }

                for index7, loopIdx2 in pairs(teamLabelAlt)do
                    loopIdx2.Visible = false
                    loopIdx2.Color = settings2.Settings.currentColors[teamLabel].Box.Outline.Visible
                    loopIdx2.Thickness = settings2.Settings.Box.Thickness
                end

                local lineObj, line2 = playerService.new('Line', {
                    Visible = false,
                    Thickness = settings2.Settings.Tracer.Thickness,
                    From = tracerUtil(runService2, settings2),
                }), {
                    Outline = playerService.new'Square',
                    Fill = playerService.new'Square',
                    Text = playerService.new'Text',
                }

                for loopK, loopL in pairs(line2)do
                    loopL.Visible = false

                    local valueE

                    repeat
                        task.wait()
                    until player11

                    local healthSource2, maxHealthSource2 = settings2.Settings.HealthBar.Source(Player, 'Health'), settings2.Settings.HealthBar.Source(Player, 'MaxHealth')

                    if healthSource2 / maxHealthSource2 > 0.6 then
                        valueE = 'High'
                    elseif healthSource2 / maxHealthSource2 > 0.2 then
                        valueE = 'Medium'
                    else
                        valueE = 'Low'
                    end
                    if not settings2.Settings.currentColors[teamLabel].HealthBar then
                        continue
                    end
                    if loopL == line2.Fill then
                        loopL.Color = settings2.Settings.currentColors[teamLabel].HealthBar.Fills[valueE]
                        loopL.Filled = true
                    elseif loopL == line2.Text then
                        loopL.Center = true
                        loopL.Size = settings2.Settings.TextSize
                        loopL.Color = settings2.Settings.currentColors[teamLabel].HealthBar.Fills[valueE]
                        loopL.Font = 2
                    else
                        loopL.Filled = false
                    end
                end

                local ui = {
                    Name = playerService.new'Text',
                    Distance = playerService.new'Text',
                }

                for loopI2, loopJ2 in pairs(ui)do
                    loopJ2.Visible = false
                    loopJ2.Center = true
                    loopJ2.Size = settings2.Settings.TextSize
                    loopJ2.Color = settings2.Settings.currentColors[teamLabel].Text
                    loopJ2.Font = 2
                    loopJ2.Outline = true
                end

                local line3, lineColorObj = playerService.new('Line', {
                    Visible = false,
                    Color = settings2.Settings.currentColors[teamLabel].Box.Outline.Visible,
                    Thickness = 1,
                }), Instance.new'Highlight'

                lineColorObj.FillColor = settings2.Settings.currentColors[teamLabel].Chams.Fill.Visible
                lineColorObj.OutlineColor = settings2.Settings.currentColors[teamLabel].Chams.Outline.Visible
                lineColorObj.FillTransparency = settings2.Settings.Chams.Fill.Transparency
                lineColorObj.OutlineTransparency = settings2.Settings.Chams.Outline.Transparency
                lineColorObj.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                lineColorObj.Enabled = false

                if not settings2.ObjectESPs then
                    settings2.ObjectESPs = {
                        Highlights = {},
                        ESPs = {},
                    }
                end
                if settings2.ObjectESPs.Highlights then
                    settings2.ObjectESPs.Highlights[player11] = lineColorObj
                end

                camera2 = player11:IsA'Part' and player11 or camera2 or player11:IsA'Model' and player11:FindFirstChildOfClass'Part'

                local metaTable = setmetatable({
                    Box = teamLabelAlt,
                    Tracer = lineObj,
                    HealthBar = line2,
                    Info = ui,
                    Snapline = line3,
                    Fills = {},
                    rootPart = camera2,
                    highlight = lineColorObj,
                    object = player11,
                }, settingsTable)

                settings2.ObjectESPs.ESPs[player11] = metaTable

                return metaTable
            end
            function settingsTable:UpdateESP(options2)
                if not options2.Settings.ObjectsEnabled then
                    print'not enabled'

                    return
                end

                local selfRef = self

                if not selfRef then
                    print'esp not found'

                    return
                end

                local character6 = self.object

                if not character6 then
                    for part3, child in pairs(selfRef.Box)do
                        child.Visible = false
                    end

                    selfRef.Tracer.Visible = false

                    for part4, child2 in pairs(selfRef.HealthBar)do
                        child2.Visible = false
                    end
                    for part5, child3 in pairs(selfRef.Info)do
                        child3.Visible = false
                    end
                    for part6, child4 in pairs(selfRef.Fills)do
                        child4.Visible = false
                    end

                    selfRef.Snapline.Visible = false
                    selfRef.highlight.Enabled = false

                    return
                end

                local rootPart3, humanoid3 = self.rootPart, character6:FindFirstChild'Humanoid'

                if not rootPart3 then
                    for player12, i4 in pairs(selfRef.Box)do
                        i4.Visible = false
                    end

                    selfRef.Tracer.Visible = false

                    for player13, i5 in pairs(selfRef.HealthBar)do
                        i5.Visible = false
                    end
                    for player14, i6 in pairs(selfRef.Info)do
                        i6.Visible = false
                    end
                    for player15, i7 in pairs(selfRef.Fills)do
                        i7.Visible = false
                    end

                    selfRef.Snapline.Visible = false
                    selfRef.highlight.Enabled = false

                    return
                end

                local screenPos5, onScreen = lightingService:WorldToViewportPoint(rootPart3.Position)

                if not onScreen then
                    for key2, value6 in pairs(selfRef.Box)do
                        value6.Visible = false
                    end

                    selfRef.Tracer.Visible = false

                    for key3, value7 in pairs(selfRef.HealthBar)do
                        value7.Visible = false
                    end
                    for key4, value8 in pairs(selfRef.Info)do
                        value8.Visible = false
                    end
                    for key5, value9 in pairs(selfRef.Fills)do
                        value9.Visible = false
                    end

                    selfRef.Snapline.Visible = false
                    selfRef.highlight.Enabled = false

                    return
                end
                if humanoid3 then
                    if humanoid3.Health <= 0 then
                        for key6, value10 in pairs(selfRef.Box)do
                            value10.Visible = false
                        end

                        selfRef.Tracer.Visible = false

                        for key7, value11 in pairs(selfRef.HealthBar)do
                            value11.Visible = false
                        end
                        for key8, value12 in pairs(selfRef.Info)do
                            value12.Visible = false
                        end
                        for key9, value13 in pairs(selfRef.Fills)do
                            value13.Visible = false
                        end

                        selfRef.Snapline.Visible = false
                        selfRef.highlight.Enabled = false

                        return
                    end
                end

                local screenPos6, onScreen2 = lightingService:WorldToViewportPoint(rootPart3.Position)
                local distance3, isVisible2 = (rootPart3.Position - lightingService.CFrame.Position).Magnitude, true

                if onScreen2 then
                    if not (#workspace.CurrentCamera:GetPartsObscuringTarget({
                        workspace.CurrentCamera.CFrame.Position,
                        rootPart3.Position,
                    }, {rootPart3}) == 0) then
                        isVisible2 = false

                        if options2.Settings.Checks.Visible.Enabled and options2.Settings.Checks.Visible.OnlyVisible then
                            for idx2, item4 in pairs(selfRef.Box)do
                                item4.Visible = false
                            end

                            selfRef.Tracer.Visible = false

                            for idx3, item5 in pairs(selfRef.HealthBar)do
                                item5.Visible = false
                            end
                            for idx4, item6 in pairs(selfRef.Info)do
                                item6.Visible = false
                            end
                            for idx5, item7 in pairs(selfRef.Fills)do
                                item7.Visible = false
                            end

                            selfRef.Snapline.Visible = false
                            selfRef.highlight.Enabled = false

                            return
                        end
                    end
                end
                if not onScreen2 or distance3 > options2.Settings.MaxDistance then
                    for idx6, loopKey2 in pairs(selfRef.Box)do
                        loopKey2.Visible = false
                    end

                    selfRef.Tracer.Visible = false

                    for loopValue, index8 in pairs(selfRef.HealthBar)do
                        index8.Visible = false
                    end
                    for item8, player16 in pairs(selfRef.Info)do
                        player16.Visible = false
                    end
                    for playerData, entity2 in pairs(selfRef.Fills)do
                        entity2.Visible = false
                    end

                    selfRef.Snapline.Visible = false
                    selfRef.highlight.Enabled = false

                    return
                end

                local playerType = 'generic'

                if options2.Settings.Checks.Team.Enabled then
                    if not options2.Settings.Checks.Team.SelectedTeams[playerType] then
                        for team2, member in pairs(selfRef.Box)do
                            member.Visible = false
                        end

                        selfRef.Tracer.Visible = false

                        for object, component in pairs(selfRef.HealthBar)do
                            component.Visible = false
                        end
                        for part7, subPart in pairs(selfRef.Info)do
                            subPart.Visible = false
                        end
                        for root, child5 in pairs(selfRef.Fills)do
                            child5.Visible = false
                        end

                        selfRef.Snapline.Visible = false
                        selfRef.highlight.Enabled = false

                        return
                    end
                end

                local neutralFlag = {Neutral = true}
                local origin2, outlineColor2, fillColor2, thickness4, duration, transparency2, zIndex, priority, size2, cframe = colorUtil(runService2, options2, neutralFlag, isVisible2, 'Box', 'Outline'), colorUtil(runService2, options2, neutralFlag, isVisible2, 'Box', 'Fill'), colorUtil(runService2, options2, neutralFlag, isVisible2, 'Tracer'), colorUtil(runService2, options2, neutralFlag, isVisible2, 'Text'), colorUtil(runService2, options2, neutralFlag, isVisible2, 'Chams', 'Outline'), colorUtil(runService2, options2, neutralFlag, isVisible2, 'Chams', 'Fill'), colorUtil(runService2, options2, neutralFlag, isVisible2, 'HealthBar', 'Fill'), colorUtil(runService2, options2, neutralFlag, isVisible2, 'HealthBar', 'Outline'), character6:IsA'Model' and character6:GetExtentsSize() or character6.Size, rootPart3.CFrame
                local topScreenPos, bottomScreenPos = lightingService:WorldToViewportPoint(cframe * CFrame.new(0, size2.Y / 2, 0).Position)
                local leftScreenPos, rightScreenPos = lightingService:WorldToViewportPoint(cframe * CFrame.new(0, -size2.Y / 2, 0).Position)
                local screenPos7 = lightingService:WorldToViewportPoint(cframe.Position)

                if not bottomScreenPos or not rightScreenPos then
                    for screenX2, screenY2 in pairs(selfRef.Box)do
                        screenY2.Visible = false
                    end

                    return
                end

                local scaleFactor = 1 / (screenPos7.Z * math.tan(math.rad(lightingService.FieldOfView / 2)) * 2) * 1000
                local boxWidth, boxHeight, centerX2, centerY2 = math.floor(4.5 * scaleFactor), math.floor(6 * scaleFactor), math.floor(screenPos7.X), math.floor(screenPos7.Y)
                local boxTopLeft, boxSize = Vector2.new(math.floor(centerX2 - boxWidth / 2), math.floor((centerY2 - boxHeight / 2) + (scaleFactor / 2))), Vector2.new(boxWidth, boxHeight)

                for cornerX, cornerY in pairs(selfRef.Box)do
                    cornerY.Visible = false
                end

                if options2.Settings.Box.Enabled then
                    if options2.Settings.Box.Style == 3 then
                        local offsetX5, offsetY5 = {
                            TL = lightingService:WorldToViewportPoint((cframe * CFrame.new(-size2.X / 2, size2.Y / 2, -size2.Z / 2)).Position),
                            TR = lightingService:WorldToViewportPoint((cframe * CFrame.new(size2.X / 2, size2.Y / 2, -size2.Z / 2)).Position),
                            BL = lightingService:WorldToViewportPoint((cframe * CFrame.new(-size2.X / 2, -size2.Y / 2, -size2.Z / 2)).Position),
                            BR = lightingService:WorldToViewportPoint((cframe * CFrame.new(size2.X / 2, -size2.Y / 2, -size2.Z / 2)).Position),
                        }, {
                            TL = lightingService:WorldToViewportPoint((cframe * CFrame.new(-size2.X / 2, size2.Y / 2, size2.Z / 2)).Position),
                            TR = lightingService:WorldToViewportPoint((cframe * CFrame.new(size2.X / 2, size2.Y / 2, size2.Z / 2)).Position),
                            BL = lightingService:WorldToViewportPoint((cframe * CFrame.new(-size2.X / 2, -size2.Y / 2, size2.Z / 2)).Position),
                            BR = lightingService:WorldToViewportPoint((cframe * CFrame.new(size2.X / 2, -size2.Y / 2, size2.Z / 2)).Position),
                        }

                        if not (offsetX5.TL.Z > 0 and offsetX5.TR.Z > 0 and offsetX5.BL.Z > 0 and offsetX5.BR.Z > 0 and offsetY5.TL.Z > 0 and offsetY5.TR.Z > 0 and offsetY5.BL.Z > 0 and offsetY5.BR.Z > 0) then
                            for pointIndex, pointCount in pairs(selfRef.Box)do
                                pointCount.Visible = false
                            end

                            return
                        end

                        local vector = function(point2)
                            return Vector2.new(point2.X, point2.Y)
                        end

                        offsetX5.TL, offsetX5.TR = vector(offsetX5.TL), vector(offsetX5.TR)
                        offsetX5.BL, offsetX5.BR = vector(offsetX5.BL), vector(offsetX5.BR)
                        offsetY5.TL, offsetY5.TR = vector(offsetY5.TL), vector(offsetY5.TR)
                        offsetY5.BL, offsetY5.BR = vector(offsetY5.BL), vector(offsetY5.BR)
                        selfRef.Box.TopLeft.From = offsetX5.TL
                        selfRef.Box.TopLeft.To = offsetX5.TR
                        selfRef.Box.TopLeft.Visible = true
                        selfRef.Box.TopRight.From = offsetX5.TR
                        selfRef.Box.TopRight.To = offsetX5.BR
                        selfRef.Box.TopRight.Visible = true
                        selfRef.Box.BottomLeft.From = offsetX5.BL
                        selfRef.Box.BottomLeft.To = offsetX5.BR
                        selfRef.Box.BottomLeft.Visible = true
                        selfRef.Box.BottomRight.From = offsetX5.TL
                        selfRef.Box.BottomRight.To = offsetX5.BL
                        selfRef.Box.BottomRight.Visible = true
                        selfRef.Box.Left.From = offsetY5.TL
                        selfRef.Box.Left.To = offsetY5.TR
                        selfRef.Box.Left.Visible = true
                        selfRef.Box.Right.From = offsetY5.TR
                        selfRef.Box.Right.To = offsetY5.BR
                        selfRef.Box.Right.Visible = true
                        selfRef.Box.Top.From = offsetY5.BL
                        selfRef.Box.Top.To = offsetY5.BR
                        selfRef.Box.Top.Visible = true
                        selfRef.Box.Bottom.From = offsetY5.TL
                        selfRef.Box.Bottom.To = offsetY5.BL
                        selfRef.Box.Bottom.Visible = true

                        local origin3 = function(idx7, startPoint2, endPoint2)
                            return playerService.new('Line', {
                                Visible = endPoint2,
                                Color = origin2,
                                Thickness = options2.Settings.Box.Thickness,
                                From = idx7,
                                To = startPoint2,
                            })
                        end
                        local origin4 = function(vecA, vecB, vecC, vecD, vecE)
                            local vec1 = function(vecF, vecG)
                                return vecF.X * vecG.X + vecF.Y * vecG.Y
                            end
                            local vector2 = function(vec22)
                                return math.sqrt(vec22.X * vec22.X + vec22.Y * vec22.Y)
                            end
                            local inputValue = function(input2)
                                local output2 = vector2(input2)

                                if output2 == 0 then
                                    return Vector2.new(0, 0)
                                end

                                return Vector2.new(input2.X / output2, input2.Y / output2)
                            end
                            local deltaLocal = function()
                                local delta3 = vecC - vecA
                                local processed = vector2(delta3)

                                if processed == 0 then
                                    local midX2, midY2 = (vecA + vecD) * 0.5, (vecB + vecC) * 0.5

                                    return midX2, midY2, 1
                                end

                                local perpVector = Vector2.new(-delta3.Y, delta3.X)
                                local queryResult = inputValue(perpVector)

                                if queryResult.X == 0 and queryResult.Y == 0 then
                                    return (vecA + vecD) * 0.5, (vecB + vecC) * 0.5, 1
                                end

                                local absDotX, absDotY = math.abs(vec1(vecD - vecA, queryResult)), math.abs(vec1(vecB - vecC, queryResult))
                                local average, averageY, averageZ = (absDotX + absDotY) * 0.5, (vecA + vecB) * 0.5, (vecD + vecC) * 0.5

                                return averageY, averageZ, average
                            end
                            local resultLocal, tempLocal, valueLocal = deltaLocal()
                            local fills3, fillCount, fillIndex = selfRef.Fills or {}, vecE, nil

                            if fills3[fillCount] and fills3[fillCount].Position == nil then
                                fillIndex = fills3[fillCount]
                            else
                                fillIndex = playerService.new'Line'
                                fills3[fillCount] = fillIndex
                            end

                            fillIndex.Visible = isVisible2 and options2.Settings.Box.Filled.Enabled or false
                            fillIndex.Color = outlineColor2
                            fillIndex.Transparency = options2.Settings.Box.Filled.Transparency
                            fillIndex.Thickness = valueLocal
                            fillIndex.From = resultLocal
                            fillIndex.To = tempLocal
                            selfRef.Fills = fills3

                            return fillIndex
                        end

                        origin4(offsetX5.TL, offsetX5.TR, offsetX5.BL, offsetX5.BR, 1)
                        origin4(offsetY5.TL, offsetY5.TR, offsetY5.BL, offsetY5.BR, 2)
                        origin4(offsetX5.TL, offsetY5.TL, offsetX5.BL, offsetY5.BL, 3)
                        origin4(offsetX5.TR, offsetY5.TR, offsetX5.BR, offsetY5.BR, 4)
                        origin4(offsetX5.TL, offsetX5.TR, offsetY5.TR, offsetY5.TL, 5)
                        origin4(offsetX5.BL, offsetX5.BR, offsetY5.BR, offsetY5.BL, 6)

                        local corner = {
                            origin3(offsetX5.TL, offsetY5.TL, true),
                            origin3(offsetX5.TR, offsetY5.TR, true),
                            origin3(offsetX5.BL, offsetY5.BL, true),
                            origin3(offsetX5.BR, offsetY5.BR, true),
                        }

                        task.defer(function()
                            task.wait(options2.Settings.Framerate or 1.6666666666666665E-2)

                            for i8, j2 in ipairs(corner)do
                                pcall(j2.Remove, j2)
                                pcall(j2.Destroy, j2)
                            end
                        end)
                    else
                        local shape = function(startPos4, endPos3)
                            local fill, fillCountIdx, fillIdx = selfRef.Fills or {}, 1, nil

                            if fill[fillCountIdx] and fill[fillCountIdx].From == nil then
                                fillIdx = fill[fillCountIdx]
                            else
                                fillIdx = playerService.new'Square'
                                fill[fillCountIdx] = fillIdx
                            end

                            fillIdx.Visible = isVisible2 and options2.Settings.Box.Filled.Enabled or false
                            fillIdx.Color = outlineColor2
                            fillIdx.Transparency = options2.Settings.Box.Filled.Transparency
                            fillIdx.Filled = true
                            fillIdx.Position = startPos4
                            fillIdx.Size = endPos3 - startPos4
                            selfRef.Fills = fill

                            return fillIdx
                        end

                        shape(boxTopLeft, boxTopLeft + Vector2.new(boxSize.X, boxSize.Y))

                        if options2.Settings.Box.Style == 1 then
                            local scaleFactor2 = boxWidth * 0.2

                            selfRef.Box.TopLeft.From = boxTopLeft
                            selfRef.Box.TopLeft.To = boxTopLeft + Vector2.new(scaleFactor2, 0)
                            selfRef.Box.TopLeft.Visible = true
                            selfRef.Box.TopRight.From = boxTopLeft + Vector2.new(boxSize.X, 0)
                            selfRef.Box.TopRight.To = boxTopLeft + Vector2.new(boxSize.X - scaleFactor2, 0)
                            selfRef.Box.TopRight.Visible = true
                            selfRef.Box.BottomLeft.From = boxTopLeft + Vector2.new(0, boxSize.Y)
                            selfRef.Box.BottomLeft.To = boxTopLeft + Vector2.new(scaleFactor2, boxSize.Y)
                            selfRef.Box.BottomLeft.Visible = true
                            selfRef.Box.BottomRight.From = boxTopLeft + Vector2.new(boxSize.X, boxSize.Y)
                            selfRef.Box.BottomRight.To = boxTopLeft + Vector2.new(boxSize.X - scaleFactor2, boxSize.Y)
                            selfRef.Box.BottomRight.Visible = true
                            selfRef.Box.Left.From = boxTopLeft
                            selfRef.Box.Left.To = boxTopLeft + Vector2.new(0, scaleFactor2)
                            selfRef.Box.Left.Visible = true
                            selfRef.Box.Right.From = boxTopLeft + Vector2.new(boxSize.X, 0)
                            selfRef.Box.Right.To = boxTopLeft + Vector2.new(boxSize.X, scaleFactor2)
                            selfRef.Box.Right.Visible = true
                            selfRef.Box.Top.From = boxTopLeft + Vector2.new(0, boxSize.Y)
                            selfRef.Box.Top.To = boxTopLeft + Vector2.new(0, boxSize.Y - scaleFactor2)
                            selfRef.Box.Top.Visible = true
                            selfRef.Box.Bottom.From = boxTopLeft + Vector2.new(boxSize.X, boxSize.Y)
                            selfRef.Box.Bottom.To = boxTopLeft + Vector2.new(boxSize.X, boxSize.Y - scaleFactor2)
                            selfRef.Box.Bottom.Visible = true
                        else
                            selfRef.Box.Left.From = boxTopLeft
                            selfRef.Box.Left.To = boxTopLeft + Vector2.new(0, boxSize.Y)
                            selfRef.Box.Left.Visible = true
                            selfRef.Box.Right.From = boxTopLeft + Vector2.new(boxSize.X, 0)
                            selfRef.Box.Right.To = boxTopLeft + Vector2.new(boxSize.X, boxSize.Y)
                            selfRef.Box.Right.Visible = true
                            selfRef.Box.Top.From = boxTopLeft
                            selfRef.Box.Top.To = boxTopLeft + Vector2.new(boxSize.X, 0)
                            selfRef.Box.Top.Visible = true
                            selfRef.Box.Bottom.From = boxTopLeft + Vector2.new(0, boxSize.Y)
                            selfRef.Box.Bottom.To = boxTopLeft + Vector2.new(boxSize.X, boxSize.Y)
                            selfRef.Box.Bottom.Visible = true
                            selfRef.Box.TopLeft.Visible = false
                            selfRef.Box.TopRight.Visible = false
                            selfRef.Box.BottomLeft.Visible = false
                            selfRef.Box.BottomRight.Visible = false
                        end
                    end

                    for loopI3, loopJ3 in pairs(selfRef.Box)do
                        if loopJ3.Visible then
                            loopJ3.Color = origin2
                            loopJ3.Thickness = options2.Settings.Box.Thickness
                        end
                    end
                end
                if options2.Settings.Tracer.Enabled[playerType] then
                    selfRef.Tracer.From = tracerUtil(runService2, options2)
                    selfRef.Tracer.To = Vector2.new(screenPos6.X, screenPos6.Y)
                    selfRef.Tracer.Color = fillColor2
                    selfRef.Tracer.Visible = true
                else
                    selfRef.Tracer.Visible = false
                end
                if options2.Settings.HealthBar.Enabled[playerType] and options2.Settings.HealthBar.Source == options2.Enums.HealthSource.Humanoid then
                    local health, maxHealth = humanoid3.Health, humanoid3.MaxHealth
                    local ratio2, entityId, padding = health / maxHealth, boxSize.Y, 4
                    local healthBarX = options2.Settings.HealthBar.Position == 1 and (boxTopLeft.X - padding - 4) or (boxTopLeft.X + padding + 4 + boxSize.X)
                    local healthBarPos = Vector2.new(healthBarX, boxTopLeft.Y)

                    if options2.Settings.HealthBar.Bar then
                        selfRef.HealthBar.Outline.Size = Vector2.new(padding, entityId)
                        selfRef.HealthBar.Outline.Position = healthBarPos
                        selfRef.HealthBar.Outline.Visible = true
                        selfRef.HealthBar.Outline.Color = priority
                        selfRef.HealthBar.Fill.Size = Vector2.new(padding - 2, (entityId - 2) * ratio2)
                        selfRef.HealthBar.Fill.Position = Vector2.new(healthBarPos.X + 1, healthBarPos.Y + 1 + ((entityId - 2) * (1 - ratio2)))
                        selfRef.HealthBar.Fill.Color = zIndex
                        selfRef.HealthBar.Fill.Visible = true
                    else
                        selfRef.HealthBar.Outline.Visible = false
                        selfRef.HealthBar.Fill.Visible = false
                    end
                    if options2.Settings.HealthBar.Text then
                        selfRef.HealthBar.Text.Text = math.floor(health) .. options2.Settings.HealthBar.Suffix
                        selfRef.HealthBar.Text.Position = Vector2.new(healthBarPos.X + padding + 2, healthBarPos.Y + entityId)
                        selfRef.HealthBar.Text.Visible = true
                    else
                        selfRef.HealthBar.Text.Visible = false
                    end
                else
                    for loopIdx3, loopValue2 in pairs(selfRef.HealthBar)do
                        loopValue2.Visible = false
                    end
                end
                if options2.Settings.Name.Enabled[playerType] then
                    selfRef.Info.Name.Text = character6.Name
                    selfRef.Info.Name.Position = Vector2.new(boxTopLeft.X + boxWidth / 2, boxTopLeft.Y - 20)
                    selfRef.Info.Name.Color = thickness4
                    selfRef.Info.Name.Visible = true
                else
                    selfRef.Info.Name.Visible = false
                end
                if options2.Settings.Distance.Enabled[playerType] then
                    local inputStr = tonumber(distance3)

                    if options2.Settings.Distance.DistanceUnit == 2 then
                        inputStr = distance3 * 0.28
                    end

                    selfRef.Info.Name.Text = tostring(math.round(inputStr * 10) / 10) .. ' ' .. (options2.Settings.Distance.DistanceUnit == 2 and 'meters' or 'studs')
                    selfRef.Info.Name.Position = Vector2.new(boxTopLeft.X + boxWidth / 2, boxTopLeft.Y + boxSize.Y)
                    selfRef.Info.Name.Color = thickness4
                    selfRef.Info.Name.Visible = true
                else
                    selfRef.Info.Name.Visible = false
                end
                if options2.Settings.Snaplines then
                    selfRef.Snapline.From = Vector2.new(lightingService.ViewportSize.X / 2, lightingService.ViewportSize.Y)
                    selfRef.Snapline.To = Vector2.new(screenPos6.X, screenPos6.Y)
                    selfRef.Snapline.Color = origin2
                    selfRef.Snapline.Visible = false
                end

                local highlight2 = selfRef.highlight

                if highlight2 then
                    if options2.Settings.Chams.Enabled[playerType] and character6 then
                        highlight2.Parent = character6
                        highlight2.FillColor = transparency2
                        highlight2.OutlineColor = duration
                        highlight2.FillTransparency = options2.Settings.Chams.Fill.Enabled and options2.Settings.Chams.Fill.Transparency or 1
                        highlight2.OutlineTransparency = options2.Settings.Chams.Outline.Enabled and options2.Settings.Chams.Outline.Transparency or 1
                        highlight2.Enabled = true
                    else
                        highlight2.Enabled = false
                    end

                    highlight2.DepthMode = options2.Settings.Chams.Occlusion and Enum.HighlightDepthMode.Occluded or Enum.HighlightDepthMode.AlwaysOnTop
                end
            end
            function settingsTable:RemoveESP(config3)
                local ai = self

                if ai then
                    for key10, value14 in pairs(ai.Box)do
                        pcall(value14.Remove, value14)
                        pcall(value14.Destroy, value14)
                    end

                    pcall(ai.Tracer.Remove, ai.Tracer)
                    pcall(ai.Tracer.Destroy, ai.Tracer)

                    for key11, value15 in pairs(ai.HealthBar)do
                        pcall(value15.Remove, value15)
                        pcall(value15.Destroy, value15)
                    end
                    for key12, value16 in pairs(ai.Info)do
                        pcall(value16.Remove, value16)
                        pcall(value16.Destroy, value16)
                    end
                    for key13, value17 in pairs(ai.Fills)do
                        pcall(value17.Remove, value17)
                        pcall(value17.Destroy, value17)
                    end

                    pcall(ai.Snapline.Remove, ai.Snapline)
                    pcall(ai.Snapline.Destroy, ai.Snapline)

                    ai = nil
                end

                local highlightKey2 = ai.Highlight

                if highlightKey2 then
                    pcall(highlightKey2.Destroy, highlightKey2)

                    highlightKey2 = nil
                end
            end

            return settingsTable
        end

        function module.g()
            local cacheEntry2 = module.cache.g

            if not cacheEntry2 then
                cacheEntry2 = {
                    c = module3(),
                }
                module.cache.g = cacheEntry2
            end

            return cacheEntry2.c
        end
    end
end

local module4, cacheEntry3, service, localPlayer3, camera3 = module.a(), module.e(), module.f(), module.g(), module.c()
local playersService2, runService3, moduleSettings = module4.Players, module4.RunService, {
    Settings = {
        Enabled = false,
        ObjectsEnabled = false,
        Checks = {
            Visible = {
                Enabled = false,
                OnlyVisible = false,
                Recolor = false,
            },
            Team = {
                Enabled = false,
                SelectedTeams = {
                    enemy = false,
                    friendly = false,
                    generic = false,
                    ['local'] = false,
                },
            },
        },
        currentColors = {
            generic = {
                Box = {
                    Outline = {
                        Visible = Color3.new(1, 1, 1),
                        Invisible = Color3.new(1, 1, 1),
                    },
                    Fill = {
                        Visible = Color3.new(1, 1, 1),
                        Invisible = Color3.new(1, 1, 1),
                    },
                },
                HealthBar = {
                    Outline = Color3.new(1, 1, 1),
                    Fills = {
                        Low = Color3.new(1, 1, 1),
                        Medium = Color3.new(1, 1, 1),
                        High = Color3.new(1, 1, 1),
                    },
                },
                Tracer = {
                    Visible = Color3.new(1, 1, 1),
                    Invisible = Color3.new(1, 1, 1),
                },
                Text = Color3.new(1, 1, 1),
                Chams = {
                    Outline = {
                        Visible = Color3.new(1, 1, 1),
                        Invisible = Color3.new(1, 1, 1),
                    },
                    Fill = {
                        Visible = Color3.new(1, 1, 1),
                        Invisible = Color3.new(1, 1, 1),
                    },
                },
                Skeleton = {
                    Visible = Color3.new(1, 1, 1),
                    Invisible = Color3.new(1, 1, 1),
                },
            },
            friendly = {
                Box = {
                    Outline = {
                        Visible = Color3.new(1, 1, 1),
                        Invisible = Color3.new(1, 1, 1),
                    },
                    Fill = {
                        Visible = Color3.new(1, 1, 1),
                        Invisible = Color3.new(1, 1, 1),
                    },
                },
                HealthBar = {
                    Outline = Color3.new(1, 1, 1),
                    Fills = {
                        Low = Color3.new(1, 1, 1),
                        Medium = Color3.new(1, 1, 1),
                        High = Color3.new(1, 1, 1),
                    },
                },
                Tracer = {
                    Visible = Color3.new(1, 1, 1),
                    Invisible = Color3.new(1, 1, 1),
                },
                Text = Color3.new(1, 1, 1),
                Chams = {
                    Outline = {
                        Visible = Color3.new(1, 1, 1),
                        Invisible = Color3.new(1, 1, 1),
                    },
                    Fill = {
                        Visible = Color3.new(1, 1, 1),
                        Invisible = Color3.new(1, 1, 1),
                    },
                },
                Skeleton = {
                    Visible = Color3.new(1, 1, 1),
                    Invisible = Color3.new(1, 1, 1),
                },
            },
            enemy = {
                Box = {
                    Outline = {
                        Visible = Color3.new(1, 1, 1),
                        Invisible = Color3.new(1, 1, 1),
                    },
                    Fill = {
                        Visible = Color3.new(1, 1, 1),
                        Invisible = Color3.new(1, 1, 1),
                    },
                },
                HealthBar = {
                    Outline = Color3.new(1, 1, 1),
                    Fills = {
                        Low = Color3.new(1, 1, 1),
                        Medium = Color3.new(1, 1, 1),
                        High = Color3.new(1, 1, 1),
                    },
                },
                Tracer = {
                    Visible = Color3.new(1, 1, 1),
                    Invisible = Color3.new(1, 1, 1),
                },
                Text = Color3.new(1, 1, 1),
                Chams = {
                    Outline = {
                        Visible = Color3.new(1, 1, 1),
                        Invisible = Color3.new(1, 1, 1),
                    },
                    Fill = {
                        Visible = Color3.new(1, 1, 1),
                        Invisible = Color3.new(1, 1, 1),
                    },
                },
                Skeleton = {
                    Visible = Color3.new(1, 1, 1),
                    Invisible = Color3.new(1, 1, 1),
                },
            },
            ['local'] = {
                Box = {
                    Outline = {
                        Visible = Color3.new(1, 1, 1),
                        Invisible = Color3.new(1, 1, 1),
                    },
                    Fill = {
                        Visible = Color3.new(1, 1, 1),
                        Invisible = Color3.new(1, 1, 1),
                    },
                },
                HealthBar = {
                    Outline = Color3.new(1, 1, 1),
                    Fills = {
                        Low = Color3.new(1, 1, 1),
                        Medium = Color3.new(1, 1, 1),
                        High = Color3.new(1, 1, 1),
                    },
                },
                Tracer = {
                    Visible = Color3.new(1, 1, 1),
                    Invisible = Color3.new(1, 1, 1),
                },
                Text = Color3.new(1, 1, 1),
                Chams = {
                    Outline = {
                        Visible = Color3.new(1, 1, 1),
                        Invisible = Color3.new(1, 1, 1),
                    },
                    Fill = {
                        Visible = Color3.new(1, 1, 1),
                        Invisible = Color3.new(1, 1, 1),
                    },
                },
                Skeleton = {
                    Visible = Color3.new(1, 1, 1),
                    Invisible = Color3.new(1, 1, 1),
                },
            },
            Radar = {
                Background = Color3.fromRGB(5, 5, 5),
                Border = Color3.fromRGB(35, 35, 35),
            },
        },
        HealthBar = {
            Enabled = {
                enemy = false,
                friendly = false,
                ['local'] = false,
                generic = false,
            },
            Source = function(options3, handler)
                return options3.Character.Humanoid[handler]
            end,
            Bar = false,
            Text = false,
            Position = 1,
            Suffix = 'HP',
        },
        Box = {
            Style = 1,
            Enabled = false,
            Filled = {
                Enabled = false,
                Transparency = 0.6,
            },
            Thickness = 1,
        },
        Tracer = {
            Enabled = {
                enemy = false,
                friendly = false,
                generic = false,
            },
            Origin = 1,
            Style = 1,
            Thickness = 1,
        },
        Name = {
            Enabled = {
                enemy = false,
                friendly = false,
                ['local'] = false,
                generic = false,
            },
            Style = 1,
        },
        Distance = {
            Enabled = {
                enemy = false,
                friendly = false,
                ['local'] = false,
                generic = false,
            },
            DistanceUnit = 1,
        },
        Chams = {
            Enabled = {
                enemy = false,
                friendly = false,
                ['local'] = false,
                generic = false,
            },
            Outline = {
                Enabled = true,
                Thickness = 0.1,
                Transparency = 0,
            },
            Fill = {
                Enabled = true,
                Transparency = 0.5,
            },
            Occlusion = false,
        },
        Skeleton = {
            Enabled = {
                enemy = false,
                friendly = false,
                ['local'] = false,
                generic = false,
            },
            Thickness = 1,
            Transparency = 0,
            ExplicitBodyType = nil,
        },
        Radar = {
            Enabled = true,
            Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X - 120, 120),
            Radius = 100,
            Scale = 1,
        },
        TextSize = 14,
        MaxDistance = 2000,
        RefreshRate = 8.333333333333334E-3,
        Snaplines = true,
    },
    Drawings = {
        ESP = {},
        Tracers = {},
        Boxes = {},
        Healthbars = {},
        Names = {},
        Distances = {},
        Snaplines = {},
        Radar = {},
        Skeleton = {},
    },
    Highlights = {},
    ObjectESPs = {
        Highlights = {},
        ESPs = {},
    },
    Enums = {
        HealthBarPosition = {
            Left = 1,
            Right = 2,
        },
        HealthSource = {
            NRPBS = function(data2, callback4)
                return data2.NRPBS and data2.NRPBS[callback4].Value
            end,
            Humanoid = function(settings3, context)
                return settings3.Character:FindFirstChild'Humanoid' and settings3.Character.Humanoid[context] or 100
            end,
        },
        BoxStyle = {
            CornerBoxes = 1,
            Normal = 2,
            ['3D'] = 3,
            Quad = 4,
        },
        TracerOrigin = {
            LocalHumanoid = 1,
            Mouse = 5,
            Viewports = {
                Bottom = 2,
                Top = 3,
                Center = 4,
            },
        },
        TracerStyle = {Line = 1},
        NameStyle = {
            Username = 1,
            DisplayName = 2,
        },
        DistanceUnit = {
            Studs = 1,
            Meters = 2,
        },
        SkeletonBodyType = {
            Dynamic = nil,
            R6 = 1,
            R15 = 2,
        },
    },
    _connections = {},
}

service:init(moduleSettings)

function moduleSettings:Unload()
    for entity3, key14 in ipairs(playersService2:GetPlayers())do
        cacheEntry3:RemoveESP(moduleSettings, key14)
    end
    for entity4, key15 in ipairs(moduleSettings.Drawings.ObjectESPs)do
        key15:RemoveESP(moduleSettings)
    end

    moduleSettings.Drawings.ESP = {}
    moduleSettings.Drawings.Skeleton = {}
    moduleSettings.Drawings.Radar = {}
    moduleSettings.ObjectESPs.Highlights = {}
    moduleSettings.ObjectESPs = {}
    moduleSettings.Drawings = {}
    moduleSettings.Highlights = {}

    for entity5, key16 in pairs(moduleSettings._connections)do
        key16:Disconnect()

        key16 = nil
    end
end
function moduleSettings:DisablePlayerESP()
    for entity6, key17 in ipairs(playersService2:GetPlayers())do
        local espDrawing2 = moduleSettings.Drawings.ESP[key17]

        if espDrawing2 then
            for i9, player17 in pairs(espDrawing2.Box)do
                player17.Visible = false
            end

            espDrawing2.Tracer.Visible = false

            for j3, player18 in pairs(espDrawing2.HealthBar)do
                player18.Visible = false
            end
            for k2, player19 in pairs(espDrawing2.Info)do
                player19.Visible = false
            end

            espDrawing2.Snapline.Visible = false
        end

        local bone2 = moduleSettings.Drawings.Skeleton[key17]

        if bone2 then
            for i10, j4 in pairs(bone2)do
                j4.Visible = false
            end
        end

        local highlight3 = moduleSettings.Highlights[key17]

        if highlight3 then
            highlight3.Enabled = false
        end
    end
end
function moduleSettings:DisableObjectESP()
    if not moduleSettings.ObjectESPs then
        return
    end
    if not moduleSettings.ObjectESPs.ESPs then
        return
    end

    for idx8, key18 in pairs(moduleSettings.ObjectESPs.ESPs)do
        if key18 then
            for value18, item9 in pairs(key18.Box)do
                item9.Visible = false
            end

            key18.Tracer.Visible = false

            for element, obj2 in pairs(key18.HealthBar)do
                obj2.Visible = false
            end
            for entry, data3 in pairs(key18.Info)do
                data3.Visible = false
            end

            key18.Snapline.Visible = false
        end
    end
    for counter, pair in pairs(moduleSettings.ObjectESPs.Highlights)do
        if pair then
            pair.Enabled = false
        end
    end
end
function moduleSettings:BindESPToObject(player20, settings4)
    task.defer(function()
        task.wait(1)
        service:updateobjectlist(moduleSettings)
    end)

    return localPlayer3.CreateESP(moduleSettings, player20, settings4)
end

local x2, y2 = 0, 0

table.insert(moduleSettings._connections, runService3.RenderStepped:Connect(function()
    if not moduleSettings.Settings.Enabled then
        moduleSettings:DisablePlayerESP()

        return
    end

    local currentTime = tick()

    if currentTime - x2 >= moduleSettings.Settings.RefreshRate then
        for loopItem3, index22 in ipairs(playersService2:GetPlayers())do
            if not moduleSettings.Drawings.ESP[index22] then
                cacheEntry3:CreateESP(moduleSettings, index22)
            end

            cacheEntry3:UpdateESP(moduleSettings, index22)
        end

        x2 = currentTime
    end
end))
table.insert(moduleSettings._connections, runService3.RenderStepped:Connect(function()
    if not moduleSettings.Settings.ObjectsEnabled then
        moduleSettings:DisableObjectESP()

        return
    end

    local deltaTime = tick()

    if deltaTime - y2 >= moduleSettings.Settings.RefreshRate then
        if not moduleSettings.ObjectESPs then
            return
        end

        for iter, i23 in pairs(moduleSettings.ObjectESPs.ESPs)do
            if i23 then
                i23:UpdateESP(moduleSettings)
            end
        end

        y2 = deltaTime
    end
end))
table.insert(moduleSettings._connections, playersService2.PlayerAdded:Connect(function(callback5)
    cacheEntry3:CreateESP(moduleSettings, callback5)
end))
table.insert(moduleSettings._connections, playersService2.PlayerRemoving:Connect(function(handler2)
    cacheEntry3:RemoveESP(moduleSettings, handler2)
end))

for node, child6 in ipairs(playersService2:GetPlayers())do
    cacheEntry3:CreateESP(moduleSettings, child6)
end

local function process(target4, source)
    target4 = target4 or {}
    source = source or {}

    for subIndex2, subValue in pairs(target4)do
        if type(subValue) == 'table' then
            source[subIndex2] = process(subValue, source[subIndex2] or {})
        else
            if source[subIndex2] == nil then
                source[subIndex2] = subValue
            end
        end
    end

    return source
end

function moduleSettings:SetOptions(event)
    event = event or {}

    local settingKey = moduleSettings.Settings

    moduleSettings.Settings = process(settingKey, event)
end

return moduleSettings
