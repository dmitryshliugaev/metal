//
//  Lighting.h
//  11-Maps-Materials
//
//  Created by Dmitrii Shliugaev on 16/11/2022.
//


#ifndef Lighting_h
#define Lighting_h

#import "Common.h"

float3 phongLighting(
                     float3 normal,
                     float3 position,
                     constant Params &params,
                     constant Light *lights,
                     Material material);

#endif /* Lighting_h */
