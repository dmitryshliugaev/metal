//
//  ShaderDefs.h
//  07-Fragment-function
//
//  Created by Dmitrii Shliugaev on 19/10/2022.
//

#ifndef ShaderDefs_h
#define ShaderDefs_h

#include <metal_stdlib>
using namespace metal;

struct VertexOut {
  float4 position [[position]];
  float3 normal;
};

#endif /* ShaderDefs_h */
