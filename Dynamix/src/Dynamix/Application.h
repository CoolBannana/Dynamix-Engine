#pragma once

#include "Core.h"

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
