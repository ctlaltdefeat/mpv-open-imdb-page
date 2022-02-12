function get_python_binary()
    local msg = ""

    -- try: python
    local python_version = mp.command_native({
        name = "subprocess",
        args = { "python", "--version"},
        capture_stdout = true
    })
    if python_version.error_string ~= "" then
        msg = msg.."'python' not found; "
    else
        if python_version.stdout:find("3%.") ~= nil then
            msg = msg.."'python' with version 3 found!"
            return "python", msg
        else
            msg = msg.."'python' is not version 3; "
        end
    end
    
    -- try: python3
    python_version = mp.command_native({
        name = "subprocess",
        args = { "python3", "--version" },
        capture_stdout = true
    })
    if python_version.error_string ~= "" then
        msg = msg.."'python3' not found; "
    else
        msg = msg.."'python3' found!"
        return "python3", msg
    end

    --no python 3 found
    msg = msg.."no Python 3 binary found!"
    return nil, msg
end

function callback(success, result, error)
    if result.status == 0 then
        mp.osd_message("Launched browser", 1)
    else
        mp.osd_message("Unable to find IMDb URL", 3)
    end
end

function launch_imdb()
    local python_binary, python_msg = get_python_binary()
    if python_binary ~= nil then
        mp.osd_message("Finding IMDb URL...", 30)
        local cmd = mp.command_native_async({
                name = "subprocess",
                args = {
                    python_binary,
                    mp.get_script_directory().."/open-imdb-page.py",
                    mp.get_property("filename")
                }
            },
            callback
        )
    else
       mp.osd_message("ERROR: "..python_msg, 10)
       return
    end
end

-- change key binding as desired
mp.add_key_binding('ctrl+i', 'launch-imdb', launch_imdb)
