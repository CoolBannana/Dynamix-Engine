#pragma once

#ifdef DY_PLATFORM_WINDOWS
#ifdef DY_BUILD_DLL
#define DYNAMIX_API __declspec(dllexport)

#else
#define DYNAMIX_API __declspec(dllimport)

#endif
#else
#error Dynamix Engine is a windows only app (for now)


#endif

#define BIT(x) (1 << x)
