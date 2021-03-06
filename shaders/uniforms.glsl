uniform sampler2D treeFloatBufferSampler;
uniform uvec2 treeFloatBufferAddrData;

uniform highp usampler2D treeUintBufferSampler;
uniform uvec2 treeUintBufferAddrData;

uniform sampler2D materialBufferSampler;
uniform uvec2 materialBufferAddrData;

uniform sampler2D randomBufferSampler;
uniform uvec2 randomBufferAddrData;

uniform highp sampler2DArray materialTexArraySampler;

uniform vec3 cameraPosition;
uniform mat3 cameraProjectionMatrix;

uniform vec2 subPixelJitter;
uniform highp float compositeAlpha;
