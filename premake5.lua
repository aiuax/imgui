newoption { trigger = 'cppdialect', default = 'C++17', description = 'cppdialect' }

workspace 'imgui'
    configurations { 'Debug', 'Release' }

    location(_OPTIONS['to'])
    cppdialect(_OPTIONS['cppdialect'])

    exceptionhandling 'Off'
    floatingpoint 'Fast'
    rtti 'Off'
    symbols 'On'
    warnings 'Extra'

    flags { 'FatalWarnings', 'MultiProcessorCompile' }

    filter { 'system:windows' }
        platforms { 'x86_64' }

    filter { 'system:macosx' }
        platforms { 'x86_64' }
        xcode_settings { MACOSX_DEPLOYMENT_TARGET = _OPTIONS['macostarget'] }

    filter { 'toolset:msc*', 'toolset:not msc-v140' }
        buildoptions { '/permissive-' }

    filter { 'action:vs2017', 'system:windows' }
        buildoptions { '/permissive-' }

    filter { 'configurations:Debug' }
        defines { '_DEBUG' }
        optimize 'Off'

    filter {}

    -- required until we update premake to a version that can accept action vs2019
    toolset 'msc-v142'

group 'contrib'
    import {
        ['imgui-lib'] = '.'
    }
