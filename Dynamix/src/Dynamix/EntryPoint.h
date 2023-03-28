#pragma once

#ifdef DY_PLATFORM_WINDOWS

extern Dynamix::Application* Dynamix::CreateApplication();

int main(int argc, char** argv)
{
	Dynamix::Log::Init();
	DY_CORE_WARN("Started Log");
	int a = 5;
	DY_INFO("Hello Var={0}", a);

	auto app = Dynamix::CreateApplication();
	app->Run();
	delete app;
}

#endif


