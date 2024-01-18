project "SparkEngine-Editor"
   kind "ConsoleApp"
   language "C++"
   cppdialect "C++20"
   targetdir "Binaries/%{cfg.buildcfg}"
   staticruntime "off"

   files { "Source/**.h", "Source/**.cpp" , "Source/**.c"}
   
   qt.enable()

   qtuseexternalinclude (true)

   qtpath "C:/Qt/6.6.1/msvc2019_64"

   qtmodules { "core", "gui", "widgets", "opengl" }
   
   qtprefix "Qt6"

   includedirs
   {
      "../SparkEngine-Core/Source",
      "../SparkEngine-Core/Source/Third-Party",
      "../SparkEngine-Core/Source/Third-Party/include"
   }

   links 
   { 
    "SparkEngine-Core"
   }

   defines
   {
    "_CONSOLE"
   }

   targetdir ("../Binaries/" .. OutputDir .. "/%{prj.name}")
   objdir ("../Binaries/Intermediates/" .. OutputDir .. "/%{prj.name}")

   filter "system:windows"
       systemversion "latest"
       defines { "WINDOWS" }

   filter "configurations:Debug"
       defines { "DEBUG" }
       qtsuffix "d"
       runtime "Debug"
       symbols "On"

   filter "configurations:Release"
       defines { "RELEASE" }
       runtime "Release"
       optimize "On"
       symbols "On"

   filter "configurations:Dist"
       defines { "DIST" }
       runtime "Release"
       optimize "On"
       symbols "Off"