workspace "Dynamix"
architecture "x64"

configurations
{
	"Debug",
	"Release",
	"Dist"
}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Dynamix"
location "Dynamix"
kind "SharedLib"
language "C++"

targetdir ("bin/" .. outputdir .. "/%{prj.name}")
objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

pchheader "dypch.h"
pchsource "Dynamix/src/dypch.cpp"

files
{
	"%{prj.name}/src/**.h",
	"%{prj.name}/src/**.cpp"
}

includedirs
{
	"%{prj.name}/src",
	"%{prj.name}/vendor/spdlog/include"
}

filter "system:windows"
cppdialect "C++17"
staticruntime "On"
systemversion "latest"

defines
{
	"DY_PLATFORM_WINDOWS",
	"DY_BUILD_DLL",
}

postbuildcommands
{
	("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
}

filter "configurations:Debug"
defines "DY_DEBUG"
symbols "On"

filter "configurations:Release"
defines "DY_RELEASE"
optimize "On"

filter "configurations:Dist"
defines "DY_DIST"
optimize "On"

project "Sandbox"
location "Sandbox"
kind "ConsoleApp"
language "C++"

targetdir ("bin/" .. outputdir .. "/%{prj.name}")
objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

files
{
	"%{prj.name}/src/**.h",
	"%{prj.name}/src/**.cpp"
}

includedirs
{
	"Dynamix/vendor/spdlog/include",
	"Dynamix/src"
}

links
{
	"Dynamix"
}

filter "system:windows"
cppdialect "C++17"
staticruntime "On"
systemversion "latest"

defines
{
	"DY_PLATFORM_WINDOWS"
}

filter "configurations:Debug"
defines "DY_DEBUG"
symbols "On"

filter "configurations:Release"
defines "DY_RELEASE"
optimize "On"

filter "configurations:Dist"
defines "DY_DIST"
optimize "On"
