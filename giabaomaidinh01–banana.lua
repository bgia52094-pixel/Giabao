--!strict
-- ============================================================
--  GIABAOMAIDINH01 — UI Demo (Splash + KeyGate + Dashboard)
--  Đặt trong: StarterPlayer > StarterPlayerScripts (LocalScript)
--  Mục đích: UI library hợp pháp cho game Roblox của bạn.
--  KHÔNG phải công cụ exploit / KHÔNG chạy trên executor.
-- ============================================================

local Players       = game:GetService("Players")
local TweenService  = game:GetService("TweenService")
local RunService    = game:GetService("RunService")

local player    = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ============================================================
--  CẤU HÌNH
-- ============================================================

local CONFIG = {
    Title      = "GIABAOMAIDINH01",
    Key        = "giabao14072013", -- ⚠️ đổi thành chuỗi ngẫu nhiên nếu phát tán
    SplashTime = 2.2,              -- giây, thời gian progress bar chạy
}

local COLORS = {
    bg      = Color3.fromRGB(8,  20,  32),
    panel   = Color3.fromRGB(12, 32,  48),
    accent  = Color3.fromRGB(0,  200, 255),
    accent2 = Color3.fromRGB(0,  120, 180),
    text    = Color3.fromRGB(220, 245, 255),
    sub     = Color3.fromRGB(140, 190, 220),
    danger  = Color3.fromRGB(255, 90,  90),
    dark    = Color3.fromRGB(6,  16,  26),
}

-- ============================================================
--  TIỆN ÍCH
-- ============================================================

local function corner(parent: Instance, radius: number)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius)
    c.Parent = parent
    return c
end

local function newGui(name: string, order: number): ScreenGui
    local gui = Instance.new("ScreenGui")
    gui.Name = name
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false
    gui.DisplayOrder = order
    gui.Parent = playerGui
    return gui
end

-- ============================================================
--  GIAI ĐOẠN 1 — SPLASH
-- ============================================================

local function runSplash()
    local gui = newGui("SplashGui", 100)

    local bg = Instance.new("Frame")
    bg.Size = UDim2.fromScale(1, 1)
    bg.BackgroundColor3 = COLORS.bg
    bg.BorderSizePixel = 0
    bg.Parent = gui

    local title = Instance.new("TextLabel")
    title.AnchorPoint = Vector2.new(0.5, 0.5)
    title.Position = UDim2.fromScale(0.5, 0.45)
    title.Size = UDim2.fromScale(0.6, 0.12)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBlack
    title.Text = CONFIG.Title
    title.TextColor3 = COLORS.text
    title.TextScaled = true
    title.TextTransparency = 1
    title.Parent = bg

    local barBg = Instance.new("Frame")
    barBg.AnchorPoint = Vector2.new(0.5, 0.5)
    barBg.Position = UDim2.fromScale(0.5, 0.6)
    barBg.Size = UDim2.new(0, 380, 0, 8)
    barBg.BackgroundColor3 = COLORS.accent2
    barBg.BackgroundTransparency = 0.6
    barBg.BorderSizePixel = 0
    barBg.Parent = bg
    corner(barBg, 999)

    local barFill = Instance.new("Frame")
    barFill.Size = UDim2.new(0, 0, 1, 0)
    barFill.BackgroundColor3 = COLORS.accent
    barFill.BorderSizePixel = 0
    barFill.Parent = barBg
    corner(barFill, 999)

    TweenService:Create(title, TweenInfo.new(0.6), { TextTransparency = 0 }):Play()

    local startT = os.clock()
    local conn
    conn = RunService.RenderStepped:Connect(function()
        local a = math.clamp((os.clock() - startT) / CONFIG.SplashTime, 0, 1)
        barFill.Size = UDim2.new(a, 0, 1, 0)
        if a >= 1 then conn:Disconnect() end
    end)

    task.wait(CONFIG.SplashTime + 0.35)

    local fade = TweenService:Create(bg, TweenInfo.new(0.5), { BackgroundTransparency = 1 })
    TweenService:Create(title,   TweenInfo.new(0.5), { TextTransparency = 1 }):Play()
    TweenService:Create(barBg,   TweenInfo.new(0.5), { BackgroundTransparency = 1 }):Play()
    TweenService:Create(barFill, TweenInfo.new(0.5), { BackgroundTransparency = 1 }):Play()
    fade:Play()
    fade.Completed:Wait()

    gui:Destroy()
end

-- ============================================================
--  GIAI ĐOẠN 2 — KEY GATE
-- ============================================================

local function runKeyGate(): boolean
    local gui = newGui("KeyGateGui", 90)

    local bg = Instance.new("Frame")
    bg.Size = UDim2.fromScale(1, 1)
    bg.BackgroundColor3 = COLORS.bg
    bg.BorderSizePixel = 0
    bg.Parent = gui

    local panel = Instance.new("Frame")
    panel.AnchorPoint = Vector2.new(0.5, 0.5)
    panel.Position = UDim2.fromScale(0.5, 0.5)
    panel.Size = UDim2.new(0, 420, 0, 220)
    panel.BackgroundColor3 = COLORS.panel
    panel.BorderSizePixel = 0
    panel.Parent = bg
    corner(panel, 14)

    local title = Instance.new("TextLabel")
    title.Position = UDim2.new(0, 0, 0, 18)
    title.Size = UDim2.new(1, 0, 0, 30)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.Text = "Nhập key để tiếp tục"
    title.TextColor3 = COLORS.text
    title.TextSize = 22
    title.Parent = panel

    local box = Instance.new("TextBox")
    box.AnchorPoint = Vector2.new(0.5, 0)
    box.Position = UDim2.new(0.5, 0, 0, 70)
    box.Size = UDim2.new(1, -60, 0, 44)
    box.BackgroundColor3 = COLORS.dark
    box.BorderSizePixel = 0
    box.Font = Enum.Font.Code
    box.PlaceholderText = "Nhập key..."
    box.Text = ""
    box.TextColor3 = COLORS.text
    box.TextSize = 18
    box.ClearTextOnFocus = false
    box.Parent = panel
    corner(box, 8)

    local status = Instance.new("TextLabel")
    status.AnchorPoint = Vector2.new(0.5, 0)
    status.Position = UDim2.new(0.5, 0, 0, 124)
    status.Size = UDim2.new(1, -60, 0, 20)
    status.BackgroundTransparency = 1
    status.Font = Enum.Font.Gotham
    status.Text = ""
    status.TextColor3 = COLORS.danger
    status.TextSize = 14
    status.Parent = panel

    local btn = Instance.new("TextButton")
    btn.AnchorPoint = Vector2.new(0.5, 0)
    btn.Position = UDim2.new(0.5, 0, 0, 154)
    btn.Size = UDim2.new(1, -60, 0, 44)
    btn.BackgroundColor3 = COLORS.accent
    btn.BorderSizePixel = 0
    btn.Font = Enum.Font.GothamBold
    btn.Text = "XÁC NHẬN"
    btn.TextColor3 = COLORS.dark
    btn.TextSize = 18
    btn.Parent = panel
    corner(btn, 8)

    local result: boolean? = nil

    local function submit()
        if box.Text == CONFIG.Key then
            status.TextColor3 = COLORS.accent
            status.Text = "Key hợp lệ. Đang tải..."
            result = true
            task.wait(0.35)
        else
            status.TextColor3 = COLORS.danger
            status.Text = "Key không đúng."
            local orig = panel.Position
            local info = TweenInfo.new(0.06, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, true)
            for _, dx in ipairs({ -8, 8, -6, 6, -4, 4 }) do
                TweenService:Create(panel, info, { Position = orig + UDim2.fromOffset(dx, 0) }):Play()
                task.wait(0.06)
            end
            panel.Position = orig
        end
    end

    btn.MouseButton1Click:Connect(submit)
    box.FocusLost:Connect(function(enterPressed)
        if enterPressed then submit() end
    end)

    while result == nil do
        task.wait(0.05)
    end

    local fade = TweenService:Create(bg, TweenInfo.new(0.35), { BackgroundTransparency = 1 })
    TweenService:Create(panel, TweenInfo.new(0.35), { BackgroundTransparency = 1 }):Play()
    fade:Play()
    fade.Completed:Wait()
    gui:Destroy()

    return result :: boolean
end

-- ============================================================
--  GIAI ĐOẠN 3 — DASHBOARD
-- ============================================================

local function runDashboard()
    local gui = newGui("DashboardGui", 80)

    local bg = Instance.new("Frame")
    bg.Size = UDim2.fromScale(1, 1)
    bg.BackgroundTransparency = 1
    bg.Parent = gui

    local panel = Instance.new("Frame")
    panel.AnchorPoint = Vector2.new(0.5, 0.5)
    panel.Position = UDim2.fromScale(0.5, 0.5)
    panel.Size = UDim2.new(0, 520, 0, 340)
    panel.BackgroundColor3 = COLORS.panel
    panel.BackgroundTransparency = 0.05
    panel.BorderSizePixel = 0
    panel.Parent = bg
    corner(panel, 16)

    panel.Position = UDim2.new(0.5, 0, 0.5, 40)
    panel.BackgroundTransparency = 1
    TweenService:Create(panel, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundTransparency = 0.05,
    }):Play()

    local title = Instance.new("TextLabel")
    title.Position = UDim2.new(0, 24, 0, 20)
    title.Size = UDim2.new(1, -48, 0, 28)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBlack
    title.Text = CONFIG.Title
    title.TextColor3 = COLORS.accent
    title.TextSize = 24
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = panel

    local sub = Instance.new("TextLabel")
    sub.Position = UDim2.new(0, 24, 0, 52)
    sub.Size = UDim2.new(1, -48, 0, 20)
    sub.BackgroundTransparency = 1
    sub.Font = Enum.Font.Gotham
    sub.Text = "Dashboard demo — không phải công cụ gian lận"
    sub.TextColor3 = COLORS.sub
    sub.TextSize = 14
    sub.TextXAlignment = Enum.TextXAlignment.Left
    sub.Parent = panel

    local function makeButton(y: number, label: string): TextButton
        local b = Instance.new("TextButton")
        b.Position = UDim2.new(0, 24, 0, y)
        b.Size = UDim2.new(1, -48, 0, 44)
        b.BackgroundColor3 = COLORS.bg
        b.BorderSizePixel = 0
        b.Font = Enum.Font.GothamBold
        b.Text = label
        b.TextColor3 = COLORS.text
        b.TextSize = 16
        b.Parent = panel
        corner(b, 8)

        b.MouseEnter:Connect(function()
            TweenService:Create(b, TweenInfo.new(0.15), { BackgroundColor3 = COLORS.accent }):Play()
        end)
        b.MouseLeave:Connect(function()
            TweenService:Create(b, TweenInfo.new(0.15), { BackgroundColor3 = COLORS.bg }):Play()
        end)
        return b
    end

    makeButton(96,  "Tính năng 1 (demo)").MouseButton1Click:Connect(function()
        print("[Dashboard] Nút 1 được bấm")
    end)
    makeButton(152, "Tính năng 2 (demo)").MouseButton1Click:Connect(function()
        print("[Dashboard] Nút 2 được bấm")
    end)
    makeButton(208, "Đóng").MouseButton1Click:Connect(function()
        gui:Destroy()
    end)
end

-- ============================================================
--  ENTRY POINT
-- ============================================================

for _, name in ipairs({ "SplashGui", "KeyGateGui", "DashboardGui" }) do
    local old = playerGui:FindFirstChild(name)
    if old then old:Destroy() end
end

local ok, err = pcall(function()
    runSplash()
    if runKeyGate() then
        runDashboard()
    else
        warn("[UI] Key không hợp lệ — thoát.")
    end
end)

if not ok then
    warn("[UI] Lỗi khởi tạo:", err)
end