FEATURE MainActivity.java/Impl
// Pop next pending request and execute it (implicitely mark it as IN_PROGRESS).
public static native String[] httpClientExecuteNextRequest();
 
public static native void httpClientCompleteRequest(String id, boolean status, String response);
