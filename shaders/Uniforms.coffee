ShaderSources.getUniforms = -> """
uniform sampler2D triangleBufferSampler;
uniform uint triangleBufferMask;
uniform uint triangleBufferShift;

uniform highp usampler2D octreeBufferSampler;
uniform uint octreeBufferMask;
uniform uint octreeBufferShift;

uniform vec3 cameraPosition;

uniform vec3 octreeCubeCenter;
uniform float octreeCubeSize;

"""
