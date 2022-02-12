function callback(success, result, error)
    if result.status == 0 then
        mp.osd_message("Launched browser", 1)
    else
        mp.osd_message("Unable to find IMDb URL", 3)
    end
end

function launch_imdb()
    mp.osd_message("Finding IMDb URL...", 30)
    local py_script_path = mp.get_script_directory().."/open-imdb-page.py"
    local table = {}
    table.name = "subprocess"
    table.args = {"python", py_script_path, mp.get_property("filename")}
    local cmd = mp.command_native_async(table, callback)
end

-- change key binding as desired 
mp.add_key_binding('ctrl+i', 'launch-imdb', launch_imdb)
