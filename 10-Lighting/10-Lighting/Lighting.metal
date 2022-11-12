//
//  Lighting.metal
//  10-Lighting
//
//  Created by Dmitrii Shliugaev on 12/11/2022.
//

#include <metal_stdlib>
using namespace metal;

#import "Lighting.h"

float3 phongLighting(float3 normal,
                     float3 position,
                     constant Params &params,
                     constant Light *lights,
                     float3 baseColor) {
    float3 diffuseColor = 0;
    float3 ambientColor = 0;
    float3 specularColor = 0;
    for (uint i = 0; i < params.lightCount; i++) {
        Light light = lights[i];
        switch (light.type) {
            case Sun: {
                // 1
                float3 lightDirection = normalize(-light.position);
                // 2
                float diffuseIntensity =
                  saturate(-dot(lightDirection, normal));
                // 3
                diffuseColor += light.color * baseColor * diffuseIntensity;
                break;
            }
            case Point: {
                break;
            }
            case Spot: {
                break;
            }
            case Ambient: {
                break;
            }
            case unused: {
                break;
            }
        }
    }
    return diffuseColor + specularColor + ambientColor;
}
