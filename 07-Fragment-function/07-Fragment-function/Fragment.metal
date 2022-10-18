//
//  Fragment.metal
//  07-Fragment-function
//
//  Created by Dmitrii Shliugaev on 17/10/2022.
//

#include <metal_stdlib>
using namespace metal;
#import "Common.h"

struct VertexOut {
    float4 position [[position]];
};

fragment float4 fragment_main(constant Params &params [[buffer(12)]],
                              VertexOut in [[stage_in]]) {
    float3 color = normalize(in.position.xyz);
    return float4(color, 1);
}
