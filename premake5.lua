workspace 'imgui'
    toolset 'msc-v141'
    configurations { 'Debug', 'Release' }
    location 'projects'

    import {
    }

    project 'imgui'
        kind 'StaticLib'
        language 'C++'
        cppdialect 'C++14'

        targetdir "bin/%{cfg.buildcfg}"

        files {
            "**.h",
            "**.cpp"
        }
