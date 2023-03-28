#pragma once

#ifdef DY_PLATFORM_WINDOWS

extern Dynamix::Application* Dynamix::CreateApplication();

int main(int argc, char** argv)
{
	auto app = Dynamix::CreateApplication();
	app->Run();
	delete app;
}

#endif


