#include <Dynamix.h>

class Sandbox : public Dynamix::Application
{
public :
	Sandbox()
	{

	}

	~Sandbox()
	{

	}
};

Dynamix::Application* Dynamix::CreateApplication()
{
	return new Sandbox();
}