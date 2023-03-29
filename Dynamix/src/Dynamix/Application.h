#pragma once

#include "Core.h"
#include "Events/Event.h"

namespace Dynamix {
	class DYNAMIX_API Application
	{

	public:
		Application();
		virtual ~Application();

		void Run();
	};

	Application* CreateApplication();

}
