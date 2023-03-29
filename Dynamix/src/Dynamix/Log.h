#pragma once


#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/fmt/ostr.h"

namespace Dynamix
{
	class DYNAMIX_API Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }

	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};

}

#define DY_CORE_TRACE(...)    ::Dynamix::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define DY_CORE_INFO(...)     ::Dynamix::Log::GetCoreLogger()->info(__VA_ARGS__)
#define DY_CORE_WARN(...)     ::Dynamix::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define DY_CORE_ERROR(...)    ::Dynamix::Log::GetCoreLogger()->error(__VA_ARGS__)
#define DY_CORE_FATAL(...)    ::Dynamix::Log::GetCoreLogger()->fatal(__VA_ARGS__)

#define DY_TRACE(...)    ::Dynamix::Log::GetClientLogger()->trace(__VA_ARGS__)
#define DY_INFO(...)     ::Dynamix::Log::GetClientLogger()->info(__VA_ARGS__)
#define DY_WARN(...)     ::Dynamix::Log::GetClientLogger()->warn(__VA_ARGS__)
#define DY_ERROR(...)    ::Dynamix::Log::GetClientLogger()->error(__VA_ARGS__)
#define DY_FATAL(...)    ::Dynamix::Log::GetClientLogger()->fatal(__VA_ARGS__)

