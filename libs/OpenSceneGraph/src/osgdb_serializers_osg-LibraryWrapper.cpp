#include <osgDB/Registry>

USE_SERIALIZER_WRAPPER(Drawable)
USE_SERIALIZER_WRAPPER(Geode)
USE_SERIALIZER_WRAPPER(Geometry)
USE_SERIALIZER_WRAPPER(Group)
USE_SERIALIZER_WRAPPER(MatrixTransform)
USE_SERIALIZER_WRAPPER(Node)
USE_SERIALIZER_WRAPPER(Object)
USE_SERIALIZER_WRAPPER(Transform)

extern "C" void wrapper_serializer_library_osg(void) {}

