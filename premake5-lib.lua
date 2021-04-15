project 'imgui-lib'
    kind 'StaticLib'
    language 'C++'
    targetdir 'build/bin/%{cfg.buildcfg}'

    includedependencies {
    }

    usedependencies {
    }

    includedirs {
        '.',
        'examples'
    }

    files {
        '*.h',
        '*.cpp'
    }

    filter 'system:windows'
        files {
            'examples/imgui_impl_win32.h',
            'examples/imgui_impl_dx11.h',
            'examples/imgui_impl_win32.cpp',
            'examples/imgui_impl_dx11.cpp'
        }
