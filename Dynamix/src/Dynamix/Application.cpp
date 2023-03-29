#include "dypch.h"
#include "Application.h"

#include "Events/ApplicationEvent.h"
#include "Log.h"

namespace Dynamix
{
	Application::Application()
	{

	}

	Application::~Application()
	{

	}

	void Application::Run()
	{
		WindowResizeEvent e(1280, 720);
		if (e.IsInCategory(EventCategoryApplication))
		{
			DY_TRACE(e);
		}
		if (e.IsInCategory(EventCategoryInput))
		{
			DY_TRACE(e);
		}

		while (true);
	}
}
