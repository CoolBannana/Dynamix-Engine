workspace "Dynamix"
architecture "x64"

configurations
{
	"Debug",
	"Release",
	"Dist"
}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

--Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "Dynamix/vendor/GLFW/include"

include "Dynamix/vendor/GLFW"

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
	"%{prj.name}/vendor/spdlog/include",
	"%{IncludeDir.GLFW}"
}

links
{
	"GLFW",
	"opengl32.lib"
}

filter "system:windows"
cppdialect "C++17"
staticruntime "off"
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
buildoptions "/MDd"
symbols "On"

filter "configurations:Release"
defines "DY_RELEASE"
buildoptions "/MD"
optimize "On"

filter "configurations:Dist"
defines "DY_DIST"
buildoptions "/MD"
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
staticruntime "off"
systemversion "latest"

defines
{
	"DY_PLATFORM_WINDOWS"
}

filter "configurations:Debug"
defines "DY_DEBUG"
buildoptions "/MDd"
symbols "On"

filter "configurations:Release"
defines "DY_RELEASE"
buildoptions "/MD"
optimize "On"

filter "configurations:Dist"
defines "DY_DIST"
buildoptions "/MD"
optimize "On"
