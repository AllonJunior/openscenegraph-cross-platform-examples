FEATURE main.cpp/Include
#include <emscripten/fetch.h>

FEATURE main.cpp/Callbacks
void downloadSucceeded(emscripten_fetch_t *fetch)
{
    printf(
        "FetchOnce. Finished downloading '%llu' bytes from '%s'\n",
        fetch->numBytes,
        fetch->url
    );

    const int BUF_SIZE = 100;
    // Get the body.
    if (fetch->numBytes < BUF_SIZE)
    {
        char buf[BUF_SIZE];
        strncpy(buf, fetch->data, fetch->numBytes);
        buf[fetch->numBytes + 1] = '\0';
        std::string body(buf);
        printf("FetchOnce. Received body: '%s'\n", body.c_str());
    }
    else
    {
        printf("FetchOnce. Too much data. Cannot parse\n");
    }
    emscripten_fetch_close(fetch);
}

void downloadFailed(emscripten_fetch_t *fetch)
{
    printf(
        "FetchOnce. Failed to download '%s'. HTTP status code: '%d'\n",
        fetch->url,
        fetch->status
    );
    emscripten_fetch_close(fetch);
}

FEATURE main.cpp/Run
// Create a request for a resource over HTTP.
emscripten_fetch_attr_t attr;
emscripten_fetch_attr_init(&attr);
strcpy(attr.requestMethod, "GET");
attr.attributes = EMSCRIPTEN_FETCH_LOAD_TO_MEMORY;
attr.onsuccess = downloadSucceeded;
attr.onerror = downloadFailed;
// Resource URL.
auto url = "http://127.0.0.1:7999";
// Perform the request.
emscripten_fetch(&attr, url);
printf("FetchOnce. Request resource at '%s'\n", url);