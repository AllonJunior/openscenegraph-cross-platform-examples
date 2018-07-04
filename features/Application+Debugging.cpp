FEATURE Application.h/Include
#include "debug.h"

FEATURE Application.h/Setup
this->setupDebugging(name);

FEATURE Application.h/TearDown
this->tearDebuggingDown();

FEATURE Application.h/Impl
public:
    debug::Debugger *debugger;
private:
    const std::string debuggerCallbackName = "Debugger";

    void setupDebugging(const std::string &name)
    {
        this->debugger = new debug::Debugger(this->httpClient, name);
        this->debugger->setBrokerURL("https://osgcpe-debug-broker.herokuapp.com");

        // Subscribe debugger to be processed each frame.
        this->frameReporter.addCallback(
            [&] {
                this->debugger->process();
            },
            this->debuggerCallbackName
        );
    }
    void tearDebuggingDown()
    {
        // Unsubscribe debugger.
        this->frameReporter.removeCallback(this->debuggerCallbackName);
        delete this->debugger;
    }
