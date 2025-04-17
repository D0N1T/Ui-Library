-- Auto Execute Setup
local function setupAutoExec()
    -- รับสคริปต์ปัจจุบันเป็นสตริง
    local scriptContent = readfile(getscriptpath())
    if scriptContent then
        -- บันทึกสคริปต์ปัจจุบันเพื่อใช้ภายหลัง
        writefile("NobodyAutoExec.lua", scriptContent)
        print("📄 สร้างไฟล์ auto-exec จากสคริปต์ปัจจุบันเรียบร้อย")
    else
        -- ตัวเลือกสำรองหากไม่สามารถรับสคริปต์ปัจจุบันได้
        if not isfile("NobodyAutoExec.lua") then
            warn("⚠️ ไม่สามารถสร้างไฟล์ auto-exec จากสคริปต์ปัจจุบันได้")
        end
    end
    
    -- ตั้งค่า teleport hook
    local queueOnTeleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
    if queueOnTeleport then
        queueOnTeleport('loadstring(readfile("NobodyAutoExec.lua"))()')
        print("🔄 ตั้งค่า auto-execute สำหรับเซิร์ฟเวอร์ถัดไปเรียบร้อย")
    else
        warn("⚠️ auto-execute ไม่รองรับบน exploit นี้")
    end
end
