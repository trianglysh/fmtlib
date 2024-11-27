project "fmtlib"
	language "C++"
	cppdialect "C++17"
	kind "StaticLib"
	
	targetdir "%{OutputDir.Binaries}/%{prj.name}"
	objdir    "%{OutputDir.Intermediates}/%{prj.name}"
	
	files
	{
		"include/**.h",
		"src/**.cc"
	}
	
	includedirs
	{
		"include"
	}
	
	filter "system:windows"
		systemversion "latest"
		defines
		{
			"_SILENCE_STDEXT_ARR_ITERS_DEPRECATION_WARNING"
		}
	
	filter "configurations:Development"
		runtime "Debug"
		symbols "On"
	
	filter "configurations:Preview or Shipping"
		runtime "Release"
		optimize "Speed"
	