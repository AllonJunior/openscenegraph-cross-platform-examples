
package org.opengamestudio.ex02;

public class library
{
    static
    {
        System.loadLibrary("library");
    }

    // Setup graphics context.
    public static native void init(int width, int height);
    // Rendering.
    public static native void frame();
}

