#include "dypch.h"
#include <Dynamix.h>

class ExampleLayer : public Dynamix::Layer
{
public:
	ExampleLayer()
		: Layer("Example")
	{

	}

	void OnUpdate() override
	{
		DY_INFO("ExampleLayer::Update");
	}

	void OnEvent(Dynamix::Event& event) override
	{
		DY_TRACE("{0}", event);
	}
};

class Sandbox : public Dynamix::Application
{
public :
	Sandbox()
	{
		PushLayer(new ExampleLayer());
	}

	~Sandbox()
	{

	}
};

Dynamix::Application* Dynamix::CreateApplication()
{
	return new Sandbox();
}