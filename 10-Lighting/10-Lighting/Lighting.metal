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
    float materialShininess = 32;
    float3 materialSpecularColor = float3(1, 1, 1);
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
                if (diffuseIntensity > 0) {
                  // 1 (R)
                  float3 reflection =
                      reflect(lightDirection, normal);
                  // 2 (V)
                  float3 viewDirection =
                      normalize(params.cameraPosition);
                  // 3
                  float specularIntensity =
                      pow(saturate(dot(reflection, viewDirection)),
                          materialShininess);
                  specularColor +=
                      light.specularColor * materialSpecularColor
                        * specularIntensity;
                }
                break;
            }
            case Point: {
                break;
            }
            case Spot: {
                break;
            }
            case Ambient: {
                ambientColor += light.color;
                break;
            }
            case unused: {
                break;
            }
        }
    }
    return diffuseColor + specularColor + ambientColor;
}
