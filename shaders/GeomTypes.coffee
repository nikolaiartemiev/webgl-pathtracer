Shader.geomTypesSource = """

const uint TRIANGLE_STRIDE = 24u;


// Triangle position data. Only positions are needed for ray-triangle hit tests.
struct TrianglePosData {
    vec3 vert, edge0, edge1;
};


// Auxiliary triangle data. Only needed when the triangle has been determined
// to be intersected by a ray.
struct TriangleAuxAttribs {
    vec3 vertNor, edge0Nor, edge1Nor;
    vec2 vertTex, edge0Tex, edge1Tex;
};


struct Cube {
    vec3 center;
    float size;
};


struct Ray {
    vec3 origin, dir, inverseDir;
};
"""
