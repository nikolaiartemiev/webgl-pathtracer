ShaderSources.getPathTraceSource = -> """
const uint BOUNCE_LIMIT = 5u;

const float RAY_SURFACE_OFFSET = 0.001;


vec3 tracePath(Ray ray, inout uint rngState) {
    // Accumulates the total light along the path
    vec3 incomingLight = vec3(0.0);

    // How much of the incoming light from the current ray will be transported
    // to the original ray's origin along the path that has been traced so far
    vec3 transportCoeff = vec3(1.0);

    for(uint bounce = 0u; bounce < BOUNCE_LIMIT; bounce++) {
        SceneHitTestResult htr = hitTestScene(ray);

        if(htr.hit) {
            // TODO: load material from buffer instead of selecting between
            // hard-coded options
            Material material;
            if(htr.materialIndex == 0u) {
                material = Material(
                    vec3(0.0), 0.1, vec3(1.0), vec3(0.0, 0.0, 1.0));
            }
            else if(htr.materialIndex == 1u) {
                material = Material(
                    vec3(0.0), 0.0, vec3(1.0), vec3(1.0, 0.0, 0.0));
            }
            else {
                material = Material(
                    vec3(0.0), 0.2, vec3(1.0), vec3(1.0, 1.0, 1.0));
            }

            // Use scattering function to determine the new ray's direction
            ScatterResult sr = scatterMaterial(
                ray.dir, htr.nor, material, rngState);

            ray = createRay(htr.pos + sr.dir * RAY_SURFACE_OFFSET, sr.dir);

            // Accumulate emission from surface
            incomingLight += transportCoeff * material.emissivity;

            // Calculate the new overall transport coefficient using
            // with the current material's transport coefficient
            transportCoeff *= sr.transportCoeff;
        }
        else {
            // TODO: sample background enviroment map instead
            vec3 backgroundLight = vec3(ray.dir.yyy + 0.3);

            incomingLight += transportCoeff * backgroundLight;
            break;
        }
    }

    return incomingLight;
}


"""
