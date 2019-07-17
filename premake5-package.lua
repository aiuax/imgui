project 'imgui'
    kind 'StaticLib'
    language 'C++'
    cppdialect 'C++14'

    targetdir 'bin/%{cfg.buildcfg}'

    vpaths
    {
        ['headers'] = '**.h',
        ['source'] = '**.cpp'
    }

    files
    {
        '*.h',
        '*.cpp'
    }

    filter 'system:windows'
        files
        {
            'examples/imgui_impl_win32.h',
            'examples/imgui_impl_dx11.h',
            'examples/imgui_impl_win32.cpp',
            'examples/imgui_impl_dx11.cpp'
        }

    includedirs
    {
        '.',
        'examples'
    }

