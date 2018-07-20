FEATURE library.cpp/Impl
// Convert C++ strings to JNI ones.
jobjectArray jniStrings(JNIEnv *env, const std::vector<std::string> items)
{
    jclass stringType = env->FindClass("java/lang/String");
    jobjectArray result = env->NewObjectArray(items.size(), stringType, 0);
    int id = 0;
    for (auto item : items)
    {
        jstring jniItem = env->NewStringUTF(item.c_str());
        env->SetObjectArrayElement(result, id++, jniItem);
    }
    // NOTE Do we need to free result ourselves or JVM does it already?
    return result;
}
