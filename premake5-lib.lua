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
        'backends'
    }

    files {
        '*.h',
        '*.cpp'
    }

    filter 'system:windows'
        files {
            'backends/imgui_impl_win32.h',
            'backends/imgui_impl_dx11.h',
            'backends/imgui_impl_win32.cpp',
            'backends/imgui_impl_dx11.cpp'
        }
