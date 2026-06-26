-- OBS Smart Motion Engine
-- Version: 0.1.0
-- Target: OBS Studio 32.1.2

obs = obslua

local M = {}
M.sources = {}
M.running = false

function script_description()
    return [[OBS Smart Motion Engine v0.1
Initial project skeleton.
Future commits will add motion engine, auto cover, safe margins and recording.]]
end

function script_load(settings)
    obs.script_log(obs.LOG_INFO, "OBS Smart Motion Engine loaded")
end

function script_unload()
    obs.script_log(obs.LOG_INFO, "OBS Smart Motion Engine unloaded")
end
