-- OBS Smart Motion Engine
-- Version: 0.1.1
-- Target: OBS Studio 32.1.2
obs=obslua
local M={sources={},running=false}
function script_description() return 'OBS Smart Motion Engine v0.1.1' end
local function scan_scene(scene)
 local items=obs.obs_scene_enum_items(scene)
 if items then
  for _,item in ipairs(items) do
   local src=obs.obs_sceneitem_get_source(item)
   if src then
    local name=obs.obs_source_get_name(src)
    if not M.sources[name] then M.sources[name]={name=name} end
   end
  end
  obs.sceneitem_list_release(items)
 end
end
local function scan_all()
 local scenes=obs.obs_frontend_get_scenes()
 for _,src in ipairs(scenes) do
  local sc=obs.obs_scene_from_source(src)
  if sc then scan_scene(sc) end
 end
 obs.source_list_release(scenes)
 obs.script_log(obs.LOG_INFO,'Registered '..tostring((function() local c=0 for _ in pairs(M.sources) do c=c+1 end return c end)())..' sources')
end
function script_load(settings) scan_all() end
function script_unload() end